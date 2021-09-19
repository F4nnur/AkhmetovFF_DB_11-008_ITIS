import json
import os
import codecs


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
            self.db = dict
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

    def get(self, key):
        try:
            return self.db[key]
        except KeyError:
            print("No Value Can Be Found for " + str(key))
            return False

    def delete(self, key):
        if not key in self.db:
            return False
        del self.db[key]
        self.dumpdb()
        return True

    def resetdb(self):
        self.db = {}
        self.dumpdb()
        return True


# Describing each entity with a class

class Drivers:
    def __init__(self, name, car_number, phone_number):
        self.name = name
        self.car_number = car_number
        self.phone_number = phone_number


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


# Fill classes with information

db = {'drivers': str([Drivers('Андрей', 'y 374 kk', '+79135353208'), Drivers('Вася', 'д 334 оо', '+79132346408'),
                      Drivers('Петр', 'а 178 ва', '+79135134238')]),
      'cars': str([Cars('Toyota', "y 374 kk", 'blue'), Cars('Hundai', 'д 334 оо', 'white'),
                   Cars('Chevrolet', 'а 178 ва', 'white')]),
      'location': str([DriverLocation("Андрей", 'Вахитовский'), DriverLocation("Вася", 'Приволжский'),
                       DriverLocation("Петр", 'Авиастрой')]),
      'car_mark': str([CarMark('1', 'Toyota'), CarMark('2', 'Hundai'), CarMark('2', 'Chevrolet')])}
# Saving like 1 json object
data = {'db': db}
if __name__ == '__main__':
    database = MyDB("my.json", data)
    database.dumpdb()
