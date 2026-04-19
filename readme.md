# 📊 Retail Sales Forecasting

---

This project presents a comprehensive end-to-end analysis of retail transaction data, combining multiple data science techniques to extract actionable business insights. It integrates **data cleaning, exploratory analysis, customer segmentation (RFM-based clustering), time-series forecasting, regression modeling, and market basket analysis** to understand customer behavior, predict future sales, and uncover product associations. By leveraging both statistical methods and machine learning models such as Linear Regression, Random Forest, Gradient Boosting, XGBoost, and LSTM, the project aims to provide a holistic view of retail dynamics, enabling better decision-making in inventory management, marketing strategies, and revenue optimization.

# 📊 Retail Sales Clustering (Customer Segmentation)

This module performs **customer segmentation using RFM analysis and clustering techniques** on retail transaction data. It transforms raw data into actionable customer groups for **marketing, retention, and revenue optimization**.

---

## 📁 Directory Structure

```bash
Clustering/
│
├── aggregation plots/
│   ├── monthly_revenue.png
│   ├── rfm_corr.png
│   ├── rfm_distributions.png
│   └── top_countries.png
│
├── clustering plots/
│   ├── cluster_heatmap.png
│   ├── elbow_silhouette.png
│   ├── kmeans_pca.png
│   └── snake_plot.png
│
├── evaluation plots/
│   ├── metrics_comparison.png
│   ├── pca3d_clusters.png
│   ├── segment_pie.png
│   └── silhouette_plot.png
│
├── aggregation_visualization.ipynb
├── clustering_modeling.ipynb
├── data_cleaning.ipynb
├── evaluation.ipynb
│
├── online_retail_clean.csv
├── rfm_table.csv
└── rfm_clustered.csv
```

---

## 🧹 Data Cleaning

Performed in `data_cleaning.ipynb`:

* Removed missing **CustomerID**
* Removed duplicate rows
* Filtered cancelled invoices (`InvoiceNo` starting with 'C')
* Removed invalid entries:

  * Quantity ≤ 0
  * UnitPrice ≤ 0
* Converted data types
* Created:

```text
TotalPrice = Quantity × UnitPrice
```

Output:

```
online_retail_clean.csv
```

---

## 📊 Aggregation & Feature Engineering

Performed in `aggregation_visualization.ipynb`:

### RFM Features:

* **Recency** → Days since last purchase
* **Frequency** → Number of invoices
* **Monetary** → Total spending

Output:

```
rfm_table.csv
```

---

## 📈 Exploratory Data Analysis

### Visualizations Generated

#### Aggregation Plots

* Monthly revenue trend
* RFM distributions (with outlier capping)
* Top countries by revenue
* Correlation heatmap

### Key Observations

* Sales show temporal trends
* Customer spending is highly skewed
* Certain countries dominate revenue

---

## 🤖 Clustering & Segmentation

Performed in `clustering_modeling.ipynb`

### Preprocessing

* Log transformation on Frequency & Monetary
* Standard scaling

---

### KMeans Clustering (Primary)

* Optimal `k` selected using:

  * Elbow Method
  * Silhouette Score

Final model:

```text
KMeans (k = 4)
```

---

### DBSCAN (Comparison)

* Identifies noise points
* Validates cluster structure

---

### PCA Visualization

* Reduced dimensions to 2D & 3D
* Visualized cluster separation

---

## 📊 Cluster Profiling

* Snake plot (normalized RFM comparison)
* Heatmap of cluster behavior

---

## 🧠 Customer Segments

Clusters mapped to business labels:

| Cluster | Segment             |
| ------- | ------------------- |
| 0       | At-Risk             |
| 1       | Champions           |
| 2       | Potential Loyalists |
| 3       | Lost/Inactive       |

---

## 📉 Evaluation

Performed in `evaluation.ipynb`

### Metrics Used

| Metric                  | Meaning                    |
| ----------------------- | -------------------------- |
| Silhouette Score        | Higher = better separation |
| Davies-Bouldin Index    | Lower = better             |
| Calinski-Harabasz Index | Higher = better            |

---

### Evaluation Visualizations

* Silhouette plot
* Metrics comparison across k
* 3D PCA clusters
* Segment distribution pie chart

---

## 💾 Output Files

| File                      | Description             |
| ------------------------- | ----------------------- |
| `online_retail_clean.csv` | Cleaned dataset         |
| `rfm_table.csv`           | RFM features            |
| `rfm_clustered.csv`       | Final clustered dataset |

---

## 🎯 Key Insights

* Customers can be clearly segmented into 4 groups
* High-value customers (Champions) drive majority revenue
* At-risk customers can be targeted for retention
* KMeans provides stable and interpretable clusters
* DBSCAN helps detect noise/outliers

---

## ⚙️ Tech Stack

* Python
* Pandas, NumPy
* Scikit-learn
* Matplotlib, Seaborn

---

## 📌 Summary

This module converts raw transaction data into **actionable customer intelligence**, enabling:

* Targeted marketing
* Customer retention strategies
* Revenue optimization


# 📈 Retail Sales Forecasting

This module focuses on **time-series forecasting of retail sales** using multiple machine learning and deep learning techniques. It predicts future sales patterns to support **inventory planning, demand estimation, and business decision-making**.

---

## 🚀 Overview

The forecasting pipeline includes:

* Data cleaning and preprocessing
* Time-series transformation (hourly & daily)
* Feature engineering (lags, rolling stats, time features)
* Multiple forecasting models:

  * XGBoost
  * LSTM (Deep Learning)
  * ARIMA / SARIMA
  * Prophet

---

## 📁 Directory Structure

```bash
Forecasting/
│
├── Cleaning.ipynb
├── Analysis.ipynb
├── analysis_xg_boost.ipynb
├── lstm.ipynb
├── forecasting_next_day_sales.ipynb
│
├── cleaned_online_retail.csv
├── ml_df.csv
├── xgb_sales_forecast_model.pkl
```

---

## 🧹 Data Cleaning

Performed in `Cleaning.ipynb`

* Removed null values
* Filtered invalid transactions
* Ensured correct data types
* Created:

```text
TotalSales = Quantity × UnitPrice
```

Output:

```bash
cleaned_online_retail.csv
```

---

## 📊 Time-Series Preparation

* Converted `InvoiceDate` → datetime

* Resampled data to:

  * **Hourly level (XGBoost, LSTM, Prophet)**
  * **Daily level (ARIMA)**

* Handled extreme values:

  * Capped at **95th percentile**

```text
Outlier Handling → Improves model stability
```

---

## ⚙️ Feature Engineering

### Time-Based Features

* Hour
* Day of Week
* Month
* Weekend Indicator

---

### Lag Features (VERY IMPORTANT)

* `lag_1` → Previous hour
* `lag_24` → Previous day
* `lag_168` → Previous week

---

### Rolling Feature

* `rolling_mean_24` → Moving average of last 24 hours

---

## 🤖 Models Implemented

---

## 🔹 1. XGBoost (Primary Model)

Performed in `analysis_xg_boost.ipynb`

### Approach

* Supervised regression on time-series features
* Uses lag + calendar features

### Training

* Train/Test split:

```text
Last 168 hours used as test set
```

### Performance

* MAE ≈ 398
* RMSE ≈ 807

### Outputs

* Forecast vs actual plot
* Feature importance plot

---

## 🔹 2. Recursive Forecasting (Future Prediction)

Performed in `forecasting_next_day_sales.ipynb`

* Uses trained XGBoost model (`.pkl`)
* Predicts **future 120 hours** step-by-step
* Updates predictions dynamically using previous outputs

---

## 🔹 3. LSTM (Deep Learning Model)

Performed in `lstm.ipynb`

### Key Features

* Bidirectional LSTM
* Multiple stacked layers
* Dropout + Batch Normalization

### Input Structure

* Sequence length: **336 timesteps**

### Preprocessing

* MinMax scaling
* Sequence generation

### Output

* Captures complex temporal patterns
* Forecast vs actual visualization

---

## 🔹 4. ARIMA / SARIMA

Performed in `Analysis.ipynb` 

### Steps

* Stationarity check:

  * ADF test
  * KPSS test

* Auto ARIMA:

```text
Seasonality: Weekly (m = 7)
```

### Output

* Forecast with confidence intervals
* Future prediction (30 days)

---

## 🔹 5. Prophet Model

Performed in `Analysis.ipynb`

### Features

* Handles:

  * Trend
  * Seasonality
  * Uncertainty intervals

### Improvements Applied

* Log transformation (`log1p`)
* Outlier capping

### Output

* Forecast vs actual
* Trend & seasonality components

---

## 📊 Visualizations

### Forecasting Outputs

* Forecast vs actual comparisons
* Feature importance (XGBoost)
* LSTM predictions
* Prophet components

---

## 📉 Evaluation Metrics

| Metric | Meaning                |
| ------ | ---------------------- |
| MAE    | Average absolute error |
| RMSE   | Penalizes large errors |

---

## 💾 Output Files

| File                           | Description                |
| ------------------------------ | -------------------------- |
| `cleaned_online_retail.csv`    | Clean dataset              |
| `ml_df.csv`                    | Feature-engineered dataset |
| `xgb_sales_forecast_model.pkl` | Saved XGBoost model        |

---

## 🎯 Key Insights

* Time-based features significantly improve forecasting
* XGBoost performs strongly with engineered features
* LSTM captures long-term dependencies but is computationally heavier
* ARIMA works well for simpler patterns
* Prophet provides interpretable trend + seasonality

---

## ⚙️ Tech Stack

* Python
* Pandas, NumPy
* Scikit-learn
* XGBoost
* TensorFlow / Keras
* Statsmodels, pmdarima
* Prophet
* Matplotlib, Seaborn


## 📌 Summary

This module builds a **robust forecasting system** combining:

* Classical time-series models
* Machine learning
* Deep learning

to deliver **accurate and scalable retail demand predictions**.

---

Here’s a **clean, professional, recruiter-level README** for your **Market Basket Analysis (MBA) module**, fully aligned with your code and notebook 👇

---

# 🛒 Market Basket Analysis (Association Rule Mining)

This module performs **Market Basket Analysis (MBA)** to discover relationships between products frequently purchased together. It enables **cross-selling, recommendation systems, and store layout optimization** using association rule mining techniques.

---

## 🚀 Overview

The objective is to identify **hidden patterns in customer transactions**, such as:

* Which products are frequently bought together
* Strength of relationships between items
* Product bundles for marketing strategies

We implement and compare three major algorithms:

* Apriori
* FP-Growth
* Eclat

---

## 📁 Directory Structure

```bash id="mba_tree"
Market Basket Analysis/
│
├── market_basket.ipynb
├── cleaned_online_retail.csv
```

---

## 📊 Data Preparation

Performed in `market_basket.ipynb`

### Steps:

* Loaded cleaned dataset
* Converted `InvoiceDate` to datetime
* Grouped transactions by:

```text id="txn"
InvoiceNo → Each transaction
Description → Items purchased
```

---

### Transaction Matrix (Basket)

Converted into binary format:

```text id="binary"
1 = Item purchased  
0 = Item not purchased
```

Example:

| Invoice | Bread | Milk | Butter |
| ------- | ----- | ---- | ------ |
| 1       | 1     | 1    | 0      |

---

### Filtering

* Removed rare items:

```text id="filter"
Items with support < threshold removed
```

This improves performance and relevance.

---

## 📈 Key Metrics

### 1. Support

```text id="support"
Support(A) = Transactions containing A / Total transactions
```

---

### 2. Confidence

```text id="confidence"
Confidence(A → B) = Support(A ∪ B) / Support(A)
```

---

### 3. Lift

```text id="lift"
Lift = Confidence / Support(B)
```

Interpretation:

* Lift > 1 → Strong association
* Lift = 1 → No relation
* Lift < 1 → Weak/negative relation

---

## 🤖 Algorithms Implemented

---

## 🔹 1. Apriori

* Generates candidate itemsets iteratively
* Slower but intuitive

```text id="apriori"
min_support = 0.01
min_confidence = 0.3
```

---

## 🔹 2. FP-Growth

* Uses FP-tree structure
* Faster than Apriori
* Scalable for large datasets

---

## 🔹 3. Eclat

* Uses vertical database format (TID sets)
* Uses set intersection
* Fastest among the three

---

## ⏱️ Performance Comparison

Algorithms are compared based on runtime:

* Apriori → Slow
* FP-Growth → Faster
* Eclat → Fastest

---

## 📊 Association Rules

Rules are generated using:

```text id="rules"
Support ≥ 0.005  
Confidence ≥ 0.3  
Lift ≥ 1.0
```

Top rules are sorted by **Lift** (strongest relationships).

---

## 📈 Visualizations

### 1. Algorithm Runtime Comparison

---

### 2. Product Association Heatmap

---

### 3. Network Graph (Product Clusters)

---

### 4. Top Association Rules (Lift)


---

## 🧠 Advanced Analysis

### 🔹 Pairwise Support Calculation

* Manual calculation of item pairs
* Validates algorithm output

---

### 🔹 3-Itemsets

* Identifies product bundles
* Useful for combo offers

---

### 🔹 Product Communities

* Graph-based clustering using NetworkX
* Identifies groups of related products

---

## 🎯 Recommendation System

A simple recommendation function is implemented:

```text id="rec"
Input: Product name  
Output: Top associated products (based on lift)
```

Example:

```python id="rec_example"
recommend("REGENCY TEA PLATE ROSES")
```

---

## 💾 Output

* Frequent itemsets
* Association rules
* Product clusters
* Visual insights

---

## 🎯 Key Insights

* Strong associations exist between commonly purchased items
* High lift values indicate strong cross-selling opportunities
* FP-Growth and Eclat outperform Apriori in speed
* Product clusters help optimize store layout
* Association rules enable recommendation systems

---

## ⚙️ Tech Stack

* Python
* Pandas, NumPy
* mlxtend (Apriori, FP-Growth)
* NetworkX (graph analysis)
* Matplotlib, Seaborn

---

## 📌 Summary

This module transforms transactional data into **actionable product insights**, enabling:

* Cross-selling strategies
* Product bundling
* Recommendation systems
* Store layout optimization

---

---

# 📈 Regression Modeling — Retail Sales Forecasting

This module implements multiple **supervised regression models** to predict **hourly retail sales** using engineered time-series features.

The goal is to build, compare, and evaluate models ranging from **interpretable linear methods** to **advanced ensemble techniques**, ensuring both **accuracy and explainability**.

---

## 🚀 Overview

We model sales as a regression problem:

```text
Input  → Time-based + Lag Features  
Output → Hourly Sales (£)
```

Models implemented:

* Linear Regression (OLS, Ridge, Lasso)
* Random Forest Regression
* Gradient Boosting Regression

All models follow a **consistent pipeline** for fair comparison.

---

## 📁 Directory Structure

```bash
Regression/
│
├── Linear_Regression/
│   ├── linear_regression.ipynb
│   ├── lr_sales_model.pkl
│   ├── lr_scaler.pkl
│   ├── lr_actual_vs_predicted.png
│   ├── lr_feature_coefficients.png
│   ├── lr_residual_analysis.png
│   └── lr_scatter_actual_vs_predicted.png
│
├── Random_Forest/
│   ├── random_forest_regression.ipynb
│   ├── rf_sales_model.pkl
│   ├── actual_vs_predicted.png
│   ├── feature_importance.png
│   ├── residual_analysis.png
│   └── scatter_actual_vs_predicted.png
│
├── Gradient_Boosting/
│   ├── gradient_boosting_regression.ipynb
│   ├── gb_sales_model.pkl
│   ├── gb_actual_vs_predicted.png
│   ├── gb_feature_importance.png
│   ├── gb_residual_analysis.png
│   └── gb_scatter_actual_vs_predicted.png
```

---

## 📊 Data Pipeline (Common Across Models)

All models use the same preprocessing for consistency:

### 🔹 Step 1: Revenue Calculation

```text
TotalSales = Quantity × UnitPrice
```

### 🔹 Step 2: Time Aggregation

```text
Resampled to hourly level
```

### 🔹 Step 3: Outlier Handling

```text
Capped at 95th percentile
```

### 🔹 Step 4: Feature Engineering

#### Time Features

* Hour
* Day of week
* Month
* Week of year
* Quarter
* Weekend indicator

#### Lag Features

* Sales 1 hour ago
* Sales 24 hours ago
* Sales 168 hours ago

#### Rolling Features

* Rolling mean (24h, 168h)
* Rolling std (24h)

#### Interaction

```text
hour × is_weekend
```

---

## 🔀 Train-Test Strategy

```text
Last 168 hours (1 week) → Test set  
Remaining data → Training set
```

This ensures **real-world forecasting simulation**.

---

## 🤖 Models Implemented

---

## 🔹 1. Linear Regression Models

Includes:

* OLS (baseline)
* Ridge (L2 regularization)
* Lasso (L1 regularization)

📌 Key Characteristics:

* Highly interpretable
* Requires feature scaling
* Fast training

📊 Outputs:

* Feature coefficients
* Residual plots
* Prediction scatter

📄 Source: 

---

## 🔹 2. Random Forest Regression

* Ensemble of decision trees
* Handles non-linearity well
* Robust to noise

📌 Enhancements:

* Additional time features
* Hyperparameter tuning (RandomizedSearchCV)

📊 Outputs:

* Feature importance
* Residual analysis
* Actual vs predicted plots

📄 Source: 

---

## 🔹 3. Gradient Boosting Regression

* Sequential boosting model
* Learns from previous errors
* High predictive performance

📌 Features:

* Hyperparameter optimization
* Baseline vs tuned comparison

📊 Outputs:

* Feature importance
* Residual distribution
* Performance improvement analysis

📄 Source: 

---

## 📈 Evaluation Metrics

All models evaluated using:

```text
MAE  → Mean Absolute Error  
RMSE → Root Mean Squared Error  
R²   → Explained variance
```

---

## 📊 Model Comparison

| Model             | Strength       | Weakness                        |
| ----------------- | -------------- | ------------------------------- |
| Linear Regression | Interpretable  | Limited for non-linear patterns |
| Random Forest     | Robust, stable | Less interpretable              |
| Gradient Boosting | High accuracy  | Slower training                 |

---

## 📈 Visualizations

### 🔹 Actual vs Predicted

---

### 🔹 Residual Analysis

---

### 🔹 Feature Importance / Coefficients

---

### 🔹 Scatter Plot (Actual vs Predicted)

---

## 🧠 Key Insights

* Lag features (especially 24h and 168h) are **most influential**
* Time-based patterns (hour, weekend) strongly impact sales
* Ensemble models outperform linear models in capturing complexity
* Linear models still provide valuable interpretability

---

## 💾 Model Persistence

Saved models:

* `lr_sales_model.pkl` + scaler
* `rf_sales_model.pkl`
* `gb_sales_model.pkl`

All models include **reload validation checks**.

---

## ⚙️ Tech Stack

* Python
* Pandas, NumPy
* Scikit-learn
* Matplotlib, Seaborn
* Joblib

---

## 📌 Summary

This module demonstrates a complete regression pipeline:

* Feature engineering from time-series data
* Multiple model implementations
* Hyperparameter tuning
* Cross-model comparison
* Business-relevant insights

---
