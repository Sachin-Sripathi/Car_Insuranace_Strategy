# Car_Insurance_Strategy

**Car Insurance Subscription Prediction**
This project focuses on predicting whether a customer will subscribe to a car insurance policy based on their demographic details and communication history. By analyzing the timing, frequency, and type of communication, as well as customer demographics, the project aims to improve campaign strategies and enhance subscription rates.

**Project Objective**
The objective of this project is to analyze various factors that influence car insurance subscription decisions, including:

Timing and frequency of contact.
Communication type (cellular vs. telephone).
Demographics such as age and marital status.
By identifying the most influential factors, the project seeks to optimize contact strategies for better campaign outcomes.

**Features and Data**
The dataset consists of 19 features that represent customer demographics, past interactions, and campaign outcomes. Key features include:

Age: Customer's age.

Job: Customer's occupation.

Marital Status: Whether the customer is single, married, or divorced.

Education: Customer's education level.

Car Loan & Household Insurance: Existing financial products.

Communication Type: Cellular or telephone contact.

Last Contact Timing: Month and day of last customer interaction.

Previous Attempts: Number of prior attempts to contact the customer.

Campaign Outcome: Result of the campaign (success or failure).\

**Data Preprocessing:**
**Handling Missing Data:** Missing values were addressed using imputation and padding techniques.
**Data Splitting:** The dataset was split into 70% training data and 30% testing data for model development.
**Model:** A Logistic Regression model was employed to predict whether a customer would subscribe to car insurance based on the features provided. The model was evaluated for both training and testing data accuracy.

**Key Findings**
Timing and Frequency: The months of contact significantly influenced subscription decisions, with certain months showing a higher likelihood of success.
Communication Type: Cellular contact proved more effective than traditional telephone contact in converting customers.
Demographics: Factors like age and marital status had less impact on the likelihood of subscription.
Improved Strategy: Based on these findings, more targeted strategies can be developed to enhance campaign efficiency, improve customer satisfaction, and ultimately increase subscription rates.

**Conclusion**
This project demonstrates that the timing and method of customer contact are crucial to increasing car insurance subscription rates. While demographic factors like age and marital status are less significant, optimizing communication strategies can lead to more successful outcomes.
