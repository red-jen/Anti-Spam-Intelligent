En tant que développeur IA chez BMSecurity, vous êtes chargé(e) de concevoir un système intelligent de détection de spams à partir d’emails, dans le cadre du renforcement de la sécurité des communications. Ce projet constituera la base d’une solution évolutive, destinée à être intégrée aux plateformes de messagerie de nos clients.

L’objectif est de développer un modèle de classification performant, capable de distinguer automatiquement les emails malveillants des messages légitimes, en combinant des techniques avancées de traitement du langage naturel (NLP) et d’apprentissage supervisé.

Tâches à réaliser
Analyse des données
Examiner la structure du dataset : types de colonnes, taille du jeu de données, format des emails.
Détecter et traiter les valeurs manquantes ainsi que les doublons éventuels.
Analyser la distribution de la variable cible (spam vs ham) pour comprendre l’équilibre ou le déséquilibre des classes.
Générer des WordClouds pour visualiser les mots les plus fréquents dans : les emails spam et les emails ham (légitimes)
Prétraitement du texte
Normalizer le texte en convertissant tout le contenu en minuscules.
Nettoyer le dataset en supprimant les doublons et en éliminant les lignes dont la colonne text est vide ou manquante.
Appliquer la tokenisation afin de découper chaque email en mots individuels.
Retirer les stopwords pour conserver uniquement les termes informatifs.
Supprimer la ponctuation et les caractères spéciaux via des expressions régulières ou des fonctions dédiées.
Réaliser le stemming (PorterStemmer) pour réduire les mots à leur forme racine.
Vectoriser le texte à l’aide de TfidfVectorizer() ou CountVectorizer().
Entraînement des modèles
Entraînement de différents modèles de classification et analyse de leurs performances.
Optimisation des modèles si nécessaire.
Sauvegarde du meilleur modèle et intégration dans l’application Streamlit.