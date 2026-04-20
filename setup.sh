#!/bin/bash
# ========================================================================
# Quick Setup Script for Retail Sales Analytics Dashboard (macOS/Linux)
# ========================================================================
# This script will set up the Streamlit app and all dependencies
# Run: chmod +x setup.sh && ./setup.sh
# ========================================================================

echo ""
echo "========================================================================"
echo "  RETAIL SALES ANALYTICS DASHBOARD - QUICK SETUP"
echo "========================================================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3.8+ from https://www.python.org/"
    exit 1
fi

echo "[1/5] Creating virtual environment..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create virtual environment"
    exit 1
fi

echo "[2/5] Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to activate virtual environment"
    exit 1
fi

echo "[3/5] Upgrading pip..."
python -m pip install --upgrade pip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to upgrade pip"
    exit 1
fi

echo "[4/5] Installing dependencies from requirements.txt..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install dependencies"
    echo "Please ensure requirements.txt exists in the current directory"
    exit 1
fi

echo "[5/5] Setup complete! Starting Streamlit app..."
echo ""
echo "========================================================================"
echo "   The dashboard will open in your browser at http://localhost:8501"
echo "   To stop the app, press Ctrl+C in the terminal"
echo "========================================================================"
echo ""

# Run the Streamlit app
streamlit run app.py
