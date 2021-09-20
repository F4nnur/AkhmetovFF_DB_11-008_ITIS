import json
import os
from datetime import datetime as dt


# DataBase:
class MyDB(object):
    def __init__(self, location, data):
        self.location = os.path.expanduser(location)
        self.load(self.location)
        self.db = data

    def load(self, location):
        if os.path.exists(location):
            self._load()
        else:
            self.db = str()
        return True

    def _load(self):
        self.db = json.load(open(self.location, "r", encoding='utf-8'))

    def dumpdb(self):
        try:
            with open(self.location, 'w', encoding='utf-8') as f:
                json.dump(self.db, f, ensure_ascii=False, indent=4)
            return True
        except:
            return False

    def set(self, key, value):
        try:
            self.db[str(key)] = value
            self.dumpdb()
            return True
        except Exception as e:
            print("[X] Error Saving Values to Database : " + str(e))
            return False

    def get(self, client_name, date):
        with open(self.location, 'r', encoding='utf-8') as f:
            data = json.load(f)
        result = []
        for elem in data['orders']:
            if elem['client'] == client_name and elem['date'] == date:
                result.append(elem)
                return result


# Describing each entity with a class

class Drivers:
    def __init__(self, name, car_number, phone_number):
        self.name = name
        self.car_number = car_number
        self.phone_number = phone_number


class Client:
    def __init__(self, name, phone_numb):
        self.name = name
        self.phon_numb = phone_numb


class Cars:
    def __init__(self, mark, numb, color):
        self.mark = mark
        self.numb = numb
        self.color = color


class DriverLocation:
    def __init__(self, driver, district):
        self.driver = driver
        self.district = district


class CarMark:
    def __init__(self, mark_id, car_mark):
        self.mar_id = mark_id
        self.car_mark = car_mark


class Orders:
    def __init__(self, date, driver, client):
        self.date = date
        self.driver = driver
        self.client = client


# Fill classes with information
clients = [Client('Kane', '89291938192'), Client('Sasha', '8168472364'), Client('Egor', '82313421356')]
drivers = [Drivers('Андрей', 'y 374 kk', '+79135353208'), Drivers('Вася', 'д 334 оо', '+79132346408'),
           Drivers('Петр', 'а 178 ва', '+79135134238')]
cars = [Cars('Toyota', "y 374 kk", 'blue'), Cars('Hundai', 'д 334 оо', 'white'),
        Cars('Chevrolet', 'а 178 ва', 'white')]

driver_loc = [DriverLocation("Андрей", 'Вахитовский'), DriverLocation("Вася", 'Приволжский'),
              DriverLocation("Петр", 'Авиастрой')]
order = [Orders(dt.today().strftime("%Y-%m-%d"), 'Андрей', 'Kane'),
         Orders(dt.today().strftime("%Y-%m-%d"), 'Вася', 'Sasha'),
         Orders(dt.today().strftime("%Y-%m-%d"), 'Петр', 'Egor')]
db = {
    'clients': list({"client": client.name,
                     "number_of_phone": client.phon_numb} for client in clients),
    'drivers': list({"driver": driver.name,
                     "car_number": driver.car_number,
                     'phone_number': driver.phone_number} for driver in drivers),
    'cars': list({'mark': car.mark,
                  'nmb': car.numb,
                  'color': car.color} for car in cars),
    'driver_location': list({'driver': dr.driver,
                             'location': dr.district} for dr in driver_loc),
    'orders': list({"date": order.date,
                    'driver': order.driver,
                    'client': order.client} for order in order)
}

# Saving like 1 json object
if __name__ == '__main__':
    database = MyDB("my.json", db)
    database.dumpdb()
    # получение по дате
    print(database.get('Egor', "2021-09-20"))
