-- 1 «¿ƒ¿Õ»≈

SELECT * FROM flights WHERE departure_airport = 'KZN' AND arrival_airport = 'MQF';

-- 2 «¿ƒ¿Õ»≈

SELECT *
FROM flights
WHERE departure_airport = ANY(ARRAY['SVO','VKO','DME'])
AND actual_departure = '"2017-07-30 18:10:00+03"'
AND actual_arrival - actual_departure = INTERVAL '00:25:00';

-- 3 «¿ƒ¿Õ»≈

SELECT * FROM flights fly JOIN airports_data aid
ON (fly.departure_airport = aid.airport_code AND aid.timezone = 'Asia/Vladivostok')
JOIN airports_data ad
ON (fly.arrival_airport = ad.airport_code AND ad.timezone = 'Asia/Vladivostok');