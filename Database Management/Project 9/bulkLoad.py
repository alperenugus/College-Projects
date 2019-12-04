import psycopg2
import getpass

# Bulkloading population and gdp csv files into the database.

# Credentials
user = input("Username: ")
secret = getpass.getpass()
db = psycopg2.connect(user=user, password=secret,
                      host='bartik.mines.edu', database='csci403')

cursor = db.cursor()

# Copying the data from the CSV file to the database
with open('population.csv', 'r') as f:
    next(f)  # Skip the header row.
    cursor.copy_from(f, 'population', sep=',', null="")
    db.commit()

# Same for gdp
with open('gdp.csv', 'r') as f:
    next(f)
    cursor.copy_from(f, 'gdp', sep=',', null="")
    db.commit()