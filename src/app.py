"""
🛡️ Anti-Spam Intelligent - Application Streamlit
BMSecurity - Système de Détection de Spam

Cette application permet de:
- Détecter si un email est un spam ou un email légitime
- Afficher la confiance de la prédiction
- Voir les statistiques du modèle
"""

import streamlit as st
import pickle
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer

# Télécharger les ressources NLTK (une seule fois)
@st.cache_resource
def download_nltk_data():
    nltk.download('punkt', quiet=True)
    nltk.download('stopwords', quiet=True)
    nltk.download('punkt_tab', quiet=True)

download_nltk_data()

# Configuration de la page
st.set_page_config(
    page_title="Anti-Spam Intelligent",
    page_icon="🛡️",
    layout="centered"
)

# Charger le modèle et le vectoriseur
@st.cache_resource
def load_model():
    with open('models/best_model.pkl', 'rb') as f:
        model = pickle.load(f)
    with open('models/tfidf_vectorizer.pkl', 'rb') as f:
        vectorizer = pickle.load(f)
    try:
        with open('models/model_info.pkl', 'rb') as f:
            model_info = pickle.load(f)
    except:
        model_info = {'name': 'Unknown', 'accuracy': 0.0}
    return model, vectorizer, model_info

# Fonction de prétraitement
def preprocess_text(text):
    """Prétraiter le texte comme dans l'entraînement"""
    stemmer = PorterStemmer()
    stop_words = set(stopwords.words('english'))
    
    # Convertir en minuscules
    text = str(text).lower()
    
    # Supprimer ponctuation et caractères spéciaux
    text = re.sub(r'[^a-zA-Z\s]', '', text)
    
    # Tokeniser
    tokens = word_tokenize(text)
    
    # Supprimer stopwords et appliquer stemming
    tokens = [stemmer.stem(word) for word in tokens if word not in stop_words]
    
    return ' '.join(tokens)

# Interface principale
def main():
    # Header
    st.title("🛡️ Anti-Spam Intelligent")
    st.markdown("### BMSecurity - Système de Détection de Spam")
    st.markdown("---")
    
    # Charger le modèle
    try:
        model, vectorizer, model_info = load_model()
        model_loaded = True
    except Exception as e:
        st.error(f"❌ Erreur lors du chargement du modèle: {e}")
        st.info("💡 Assurez-vous d'avoir exécuté les notebooks 02 et 03 pour générer le modèle.")
        model_loaded = False
    
    if model_loaded:
        # Afficher les infos du modèle
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Modèle", model_info.get('name', 'N/A'))
        with col2:
            accuracy = model_info.get('accuracy', 0)
            st.metric("Précision", f"{accuracy*100:.1f}%")
        
        st.markdown("---")
        
        # Zone de saisie de l'email
        st.subheader("📧 Analyser un Email")
        email_text = st.text_area(
            "Collez le contenu de l'email à analyser:",
            height=200,
            placeholder="Entrez le texte de l'email ici..."
        )
        
        # Bouton d'analyse
        if st.button("🔍 Analyser", type="primary", use_container_width=True):
            if email_text.strip():
                with st.spinner("Analyse en cours..."):
                    # Prétraiter le texte
                    text_clean = preprocess_text(email_text)
                    
                    # Vectoriser
                    text_vectorized = vectorizer.transform([text_clean])
                    
                    # Prédire
                    prediction = model.predict(text_vectorized)[0]
                    
                    # Probabilités si disponibles
                    try:
                        probas = model.predict_proba(text_vectorized)[0]
                        confidence = max(probas) * 100
                    except:
                        confidence = None
                
                # Afficher le résultat
                st.markdown("---")
                st.subheader("📊 Résultat de l'Analyse")
                
                if prediction == 1:
                    st.error("🚫 **SPAM DÉTECTÉ**")
                    st.markdown("Cet email est probablement un **spam** ou un email malveillant.")
                else:
                    st.success("✅ **EMAIL LÉGITIME**")
                    st.markdown("Cet email semble être un message **légitime** (ham).")
                
                if confidence:
                    st.progress(confidence / 100)
                    st.caption(f"Confiance: {confidence:.1f}%")
            else:
                st.warning("⚠️ Veuillez entrer le texte d'un email à analyser.")
        
        # Section exemples
        st.markdown("---")
        st.subheader("📝 Exemples à tester")
        
        col1, col2 = st.columns(2)
        
        with col1:
            st.markdown("**Exemple SPAM:**")
            spam_example = "Congratulations! You won $1,000,000! Click here to claim your prize now! Limited time offer!"
            if st.button("📋 Copier exemple spam"):
                st.code(spam_example, language=None)
        
        with col2:
            st.markdown("**Exemple HAM:**")
            ham_example = "Hi John, can we schedule a meeting for tomorrow at 3pm to discuss the project updates?"
            if st.button("📋 Copier exemple ham"):
                st.code(ham_example, language=None)
    
    # Footer
    st.markdown("---")
    st.caption("🛡️ BMSecurity - Anti-Spam Intelligent | Développé avec ❤️")

if __name__ == "__main__":
    main()
