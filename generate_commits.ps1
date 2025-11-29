# Script to generate commits with Jira-like tokens
# Run this script to create the commits one by one

# Each commit message follows the pattern: [TICKET-ID] Description

$commits = @(
    # Sprint 1: Project Setup
    @{ files = ".gitignore"; message = "[SPAM-001] chore: initialize project with gitignore" },
    @{ files = "README.md"; message = "[SPAM-002] docs: add initial project README with objectives" },
    @{ files = "context.md"; message = "[SPAM-003] docs: add project context and requirements from BMSecurity" },
    @{ files = "requirements.txt"; message = "[SPAM-004] chore: add Python dependencies for ML pipeline" },
    
    # Sprint 2: Docker Setup
    @{ files = "Dockerfile"; message = "[SPAM-005] feat: create Dockerfile for containerized environment" },
    @{ files = "docker-compose.yml"; message = "[SPAM-006] feat: add docker-compose for Jupyter and Streamlit services" },
    @{ files = ".dockerignore"; message = "[SPAM-007] chore: add dockerignore to optimize build context" },
    
    # Sprint 3: Data Analysis Notebook
    @{ files = "DataSet_Emails/"; message = "[SPAM-008] data: add email dataset for spam classification" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-009] feat: create data analysis notebook structure" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-010] feat: add dataset loading and initial exploration" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-011] feat: implement missing values detection" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-012] feat: add duplicate detection logic" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-013] feat: implement class distribution analysis" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-014] feat: add WordCloud visualization for spam emails" },
    @{ files = "notebooks/01_Data_Analysis.ipynb"; message = "[SPAM-015] feat: add WordCloud visualization for ham emails" },
    
    # Sprint 4: Preprocessing Notebook  
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-016] feat: create preprocessing notebook structure" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-017] feat: implement text normalization to lowercase" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-018] feat: add tokenization using NLTK" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-019] feat: implement stopwords removal" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-020] feat: add punctuation and special chars removal" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-021] feat: implement PorterStemmer for word stemming" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-022] feat: add TF-IDF vectorization" },
    @{ files = "notebooks/02_Preprocessing.ipynb"; message = "[SPAM-023] feat: save preprocessed data and vectorizer" },
    
    # Sprint 5: Model Training
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-024] feat: create model training notebook" },
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-025] feat: implement train-test split" },
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-026] feat: add Naive Bayes classifier" },
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-027] feat: add Logistic Regression model" },
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-028] feat: implement GridSearchCV for hyperparameter tuning" },
    @{ files = "notebooks/03_Model_Training.ipynb"; message = "[SPAM-029] feat: add model comparison and evaluation metrics" },
    
    # Sprint 6: Streamlit App
    @{ files = "src/app.py"; message = "[SPAM-030] feat: create Streamlit app for spam detection interface" }
)

Write-Host "Generated 30 commit messages with Jira tokens:" -ForegroundColor Green
Write-Host ""

$i = 1
foreach ($commit in $commits) {
    Write-Host "$i. $($commit.message)" -ForegroundColor Cyan
    $i++
}

Write-Host ""
Write-Host "To apply these commits, you would need to:" -ForegroundColor Yellow
Write-Host "1. Stage files incrementally"
Write-Host "2. Commit with each message"
Write-Host ""
Write-Host "Example:" -ForegroundColor Yellow
Write-Host "git add .gitignore"
Write-Host 'git commit -m "[SPAM-001] chore: initialize project with gitignore"'
