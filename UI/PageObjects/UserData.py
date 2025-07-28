import csv

def read_csv_file(filename):
    data= []
    with open(filename, 'r') as csvfile:
        reader=csv.reader(csvfile)
        next(reader)  # Skip header line
        for row in reader:
            data.append(row)
    return data        