# 🚀 Quick Start Guide - Retail Sales Analytics Dashboard

## ⏱️ 5-Minute Setup

### Step 1: Open Terminal/Command Prompt
Navigate to your project folder:
```bash
cd c:\Users\Pratham\Desktop\Data_Science\mini_project
```

### Step 2: Run Setup Script

**On Windows:**
```bash
setup.bat
```

**On macOS/Linux:**
```bash
chmod +x setup.sh
./setup.sh
```

The script will automatically:
- ✅ Create a virtual environment
- ✅ Install all dependencies
- ✅ Start the Streamlit dashboard

**That's it! 🎉** The app opens at: http://localhost:8501

---

## 📖 If You Prefer Manual Setup

### Windows PowerShell
```powershell
# 1. Create virtual environment
python -m venv venv

# 2. Activate it
venv\Scripts\Activate.ps1

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run the app
streamlit run app.py
```

### macOS/Linux
```bash
# 1. Create virtual environment
python3 -m venv venv

# 2. Activate it
source venv/bin/activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run the app
streamlit run app.py
```

---

## 🎯 Dashboard Navigation

Once the app loads, use the sidebar to explore:

| Icon | Section | What It Does |
|------|---------|-------------|
| 🏠 | Dashboard Overview | Key metrics & revenue trends |
| 📈 | Data Exploration | EDA, distributions, correlations |
| 🔮 | Forecasting Models | 30-90 day sales predictions |
| 📉 | Regression Models | Hourly sales predictions |
| 👥 | Customer Segmentation | RFM clustering & strategies |
| 🛒 | Market Basket Analysis | Product associations |
| 🎯 | Make Predictions | Interactive prediction tool |
| 📋 | Summary & Insights | Key findings & recommendations |

---

## ❓ Common Issues & Solutions

### Issue: "Python not found"
**Solution**: 
- Install Python 3.8+ from https://www.python.org/
- During installation, ✅ check "Add Python to PATH"
- Restart your terminal

### Issue: "ModuleNotFoundError: No module named 'streamlit'"
**Solution**:
```bash
# Make sure virtual environment is activated, then:
pip install -r requirements.txt
```

### Issue: "Address already in use" (Port 8501)
**Solution**:
```bash
# Run on different port
streamlit run app.py --server.port 8502
```

### Issue: Data files not found
**Solution**:
- Make sure you're in the correct directory
- Check that `Forecasting/cleaned_online_retail.csv` exists
- Check that `Clustering/rfm_clustered.csv` exists (if available)

---

## 🔄 Running Again Later

After initial setup, you only need:

**Windows:**
```bash
venv\Scripts\activate.bat
streamlit run app.py
```

**macOS/Linux:**
```bash
source venv/bin/activate
streamlit run app.py
```

---

## 📦 What Gets Installed

The `requirements.txt` includes:

**Data Science**
- pandas, numpy, scikit-learn
- statsmodels, pmdarima, prophet
- tensorflow, keras, xgboost

**Visualization**
- streamlit, plotly, matplotlib, seaborn

**Utilities**
- joblib, python-dateutil, pytz

---

## 🎨 Dashboard Features Checklist

Once running, try these features:

- [ ] View key metrics on homepage
- [ ] Explore data distributions in EDA section
- [ ] Compare forecasting models
- [ ] Test regression model comparisons
- [ ] View customer segments
- [ ] See product associations
- [ ] Make interactive predictions
- [ ] Read strategic recommendations

---

## 📞 Stuck? Here's What to Check

1. **Python installed?** Run: `python --version`
2. **Virtual env activated?** Look for `(venv)` in terminal
3. **Dependencies installed?** Run: `pip list`
4. **Correct directory?** Run: `pwd` or `cd` to project folder
5. **Data files exist?** Check folder structure in README

---

## 🚀 Next Steps

After getting it running:

1. **Explore all sections** - Each tab has different insights
2. **Try predictions** - Input different values in the prediction tool
3. **Review insights** - Read the Summary section for business recommendations
4. **Customize** - Modify colors, thresholds, or add your own data

---

## 💡 Pro Tips

- 🔄 **Refresh data**: Stop app (Ctrl+C) and run `streamlit run app.py` again
- 📊 **Full screen charts**: Click the expand icon on any visualization
- 💾 **Download reports**: Use browser "Save as PDF"
- 🔗 **Share dashboard**: Deploy to Streamlit Cloud (free!)

---

**Enjoy your dashboard! 📊✨**

For detailed documentation, see `STREAMLIT_README.md`
