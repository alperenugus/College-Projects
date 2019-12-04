from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
import numpy as np
import psycopg2
import getpass

# Linear regression using sklearn library
def regress(country, toBePredicted, data):
    years = np.arange(1960, 2019)
    years = years.reshape(-1, 1)

    reg = LinearRegression().fit(years, data)
    
    pred = reg.predict(years)
    # Plotting the data points and the line that is fitted
    plt.xlabel('Years')
    plt.ylabel(toBePredicted)
    plt.title(country)
    plt.scatter(years, data,  color='blue')
    plt.plot(years, pred, color='red', linewidth=3)
    plt_name = 'plots/' + country + toBePredicted
    plt.savefig(plt_name)
    plt.show()
    return reg

# Get population data for a specific G7 country from the database
def getPopulationDataForCountry(country):

    query = """SELECT * FROM population WHERE country = %s"""

    cursor.execute(query, (country,))
    resultset = cursor.fetchall()
    return resultset

# Get GDP data for a specific G7 country from the database
def getGdpDataForCountry(country):

    query = """SELECT * FROM gdp WHERE country = %s"""

    cursor.execute(query, (country,))
    resultset = cursor.fetchall()
    return resultset

# Using linear regression models, predict the future population and gdp values for a country given a specific year
def predict(country, year):
    gdp = getGdpDataForCountry(country)[0][1:]
    population = getPopulationDataForCountry(country)[0][1:]
    regGdp = regress(country, "GDP",gdp)
    regPopulation = regress(country, "Population", population)

    print(country)
    print("GDP per capita predicted value for 2060: ")
    print(regGdp.predict(np.array(year).reshape(1,1)))
    print("Population predicted value for 2060: ")
    print(int(regPopulation.predict(np.array(year).reshape(1,1))))

    return regGdp.predict(np.array(year).reshape(1,1)), regPopulation.predict(np.array(year).reshape(1,1))



# Credentials
user = input("Username: ")
secret = getpass.getpass()
db = psycopg2.connect(user=user, password=secret,
                      host='bartik.mines.edu', database='csci403')

cursor = db.cursor()

# G7 countries
countries = ['France', 'United States', 'Japan', 'United Kingdom', 'Italy', 'Canada', 'Germany']

for country in countries:
    predict(country, 2060)



