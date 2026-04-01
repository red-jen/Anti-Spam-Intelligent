# Script to APPLY the commits to the git repository
# This will actually run git add and git commit

$ErrorActionPreference = "Stop"

function Commit-File {
    param (
        [string]$File,
        [string]$Message
    )
    
    if (Test-Path $File) {
        Write-Host "Committing $File..." -ForegroundColor Cyan
        git add $File
        git commit -m "$Message"
    } else {
        Write-Host "Warning: File $File not found, skipping commit." -ForegroundColor Yellow
    }
}

# Ensure we are in the right directory
# cd "c:\Users\redaj\Desktop\AI-Cognitech\Anti-Spam-Intelligent"

# Sprint 1: Project Setup
Commit-File -File ".gitignore" -Message "[SPAM-001] chore: initialize project with gitignore"
Commit-File -File "README.md" -Message "[SPAM-002] docs: add initial project README with objectives"
Commit-File -File "context.md" -Message "[SPAM-003] docs: add project context and requirements from BMSecurity"
Commit-File -File "requirements.txt" -Message "[SPAM-004] chore: add Python dependencies for ML pipeline"

# Sprint 2: Docker Setup
Commit-File -File "Dockerfile" -Message "[SPAM-005] feat: create Dockerfile for containerized environment"
Commit-File -File "docker-compose.yml" -Message "[SPAM-006] feat: add docker-compose for Jupyter and Streamlit services"
Commit-File -File ".dockerignore" -Message "[SPAM-007] chore: add dockerignore to optimize build context"

# Sprint 3: Data Analysis Notebook
Commit-File -File "DataSet_Emails" -Message "[SPAM-008] data: add email dataset for spam classification"
# Note: We are committing the whole notebook at once since we can't easily split the file history retroactively without complex git magic
Commit-File -File "notebooks/01_Data_Analysis.ipynb" -Message "[SPAM-009] feat: create data analysis notebook with exploration and visualization"

# Sprint 4: Preprocessing Notebook
Commit-File -File "notebooks/02_Preprocessing.ipynb" -Message "[SPAM-016] feat: create preprocessing notebook with normalization and vectorization"

# Sprint 5: Model Training
Commit-File -File "notebooks/03_Model_Training.ipynb" -Message "[SPAM-024] feat: create model training notebook with classifiers and optimization"

# Sprint 6: Streamlit App
Commit-File -File "src/app.py" -Message "[SPAM-030] feat: create Streamlit app for spam detection interface"
Commit-File -File "generate_commits.ps1" -Message "[SPAM-031] docs: add commit generation script"

Write-Host "✅ All commits applied successfully!" -ForegroundColor Green
