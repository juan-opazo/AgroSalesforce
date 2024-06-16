import csv
import json
import os
# file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), filename))
def convertCSVToJSON(type, fields = []):
    data = { 'records': [] }
    csvFilePath = os.path.abspath(os.path.join(os.path.dirname(__file__), f'../../force-app/test/data/{type}.csv'))
    jsonFilePath = os.path.abspath(os.path.join(os.path.dirname(__file__), f'../../force-app/test/data/{type}.json'))
    # csvFilePath = f'{file_path}/{type}.csv'
    # jsonFilePath = f'{file_path}/{type}.json'
    with open(csvFilePath, encoding='utf-8') as csvf:
        csvReader = csv.DictReader(csvf)
        cont = 0
        for rows in csvReader:
            cont += 1
            payload = {
                'attributes': {
                    'type': type,
                    'referenceId': f'{type}Ref{cont}'
                }
            }
            for field in fields:
                payload[field] = rows[field[:-3] if "__c" in field else field]

            data['records'].append(
                payload
                # {
                #     'attributes': {
                #         'type': type,
                #         'referenceId': f'{type}Ref{cont}'
                #     },
                #     'Name': rows['Name'],
                #     'Area__c': rows['Area'],
                #     'Crop__c': rows['Crop'] 
                # }
            )
        with open(jsonFilePath, 'w', encoding='utf-8') as jsonf:
            jsonf.write(json.dumps(data, indent=4))

# convertCSVToJSON('Sector__c', ['Name', 'Area__c', 'Crop__c'])
convertCSVToJSON('SoilAnalysis__c', ['Date_Requested__c', 'pH__c', 'Sector__c'])
    # {
#     "records": [
#         {
#             "attributes": {
#                 "type": "Sector__c",
#                 "referenceId": "Sector__cRef1"
#             },
#             "Name": "Campo Z",
#             "Area__c": 121,
#             "Crop__c": "Oranges"
#         }
#     ]
# }