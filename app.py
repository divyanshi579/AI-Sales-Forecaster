from flask import Flask, render_template, request, jsonify
import pandas as pd
from prophet import Prophet
import pickle
import os

app = Flask(__name__)

# Load or train model
def get_model():
    model_path = 'models/prophet_model.pkl'
    if os.path.exists(model_path):
        with open(model_path, 'rb') as f:
            return pickle.load(f)
    else:
        # Train new model (replace with your training code)
        df = pd.read_csv('data/sales_data.csv')
        model = Prophet()
        model.fit(df)
        with open(model_path, 'wb') as f:
            pickle.dump(model, f)
        return model

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/forecast', methods=['POST'])
def forecast():
    # Get user input (days to forecast)
    days = int(request.form['days'])
    
    # Generate forecast
    model = get_model()
    future = model.make_future_dataframe(periods=days)
    forecast = model.predict(future)
    
    # Convert to JSON
    results = forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail(days)
    return jsonify(results.to_dict('records'))

if __name__ == '__main__':
    app.run(debug=True)