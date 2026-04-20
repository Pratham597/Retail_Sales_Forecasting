@echo off
REM ========================================================================
REM Quick Setup Script for Retail Sales Analytics Dashboard
REM ========================================================================
REM This script will set up the Streamlit app and all dependencies
REM Run this script from the project root directory
REM ========================================================================

echo.
echo ========================================================================
echo   RETAIL SALES ANALYTICS DASHBOARD - QUICK SETUP
echo ========================================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)

echo [1/5] Creating virtual environment...
python -m venv venv
if %errorlevel% neq 0 (
    echo ERROR: Failed to create virtual environment
    pause
    exit /b 1
)

echo [2/5] Activating virtual environment...
call venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo ERROR: Failed to activate virtual environment
    pause
    exit /b 1
)

echo [3/5] Upgrading pip...
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo ERROR: Failed to upgrade pip
    pause
    exit /b 1
)

echo [4/5] Installing dependencies from requirements.txt...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies
    echo Please ensure requirements.txt exists in the current directory
    pause
    exit /b 1
)

echo [5/5] Setup complete! Starting Streamlit app...
echo.
echo ========================================================================
echo   The dashboard will open in your browser at http://localhost:8501
echo   To stop the app, press Ctrl+C in the terminal
echo ========================================================================
echo.

REM Run the Streamlit app
streamlit run app.py

pause
