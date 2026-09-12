import mysql.connector

# 1. ვუკავშირდებით MySQL სერვერს (პაროლის და ბაზის მითითების გარეშე)
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password=""  #პაროლს შეგნებულად ვმალავ
)

cursor = conn.cursor()

# 2. თავად პითონით ვქმნით ბაზას და ვირჩევთ მას
cursor.execute("CREATE DATABASE IF NOT EXISTS lesson28_hw")
cursor.execute("USE lesson28_hw")

# 3. ცხრილის შექმნა (თუ უკვე არსებობს, თავიდან რომ შეიქმნას)
cursor.execute("DROP TABLE IF EXISTS students")

create_table_query = """
CREATE TABLE students (
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    studentFirstName VARCHAR(50),
    studentLastName VARCHAR(50),
    studentAge INT
)
"""
cursor.execute(create_table_query)

# 4. თავდაპირველი 5 სტუდენტის მონაცემები
initial_students = [
    ('გრიგოლ', 'აბულაძე', 31),
    ('ანა', 'გერგაული', 25),
    ('ქეთევან', 'კახიძე', 26),
    ('ანდრო', 'შალიკაშვილი', 29),
    ('ნინო', 'ხარაზიშვილი', 24)
]

insert_query = """
INSERT INTO students (studentFirstName, studentLastName, studentAge)
VALUES (%s, %s, %s)
"""

cursor.executemany(insert_query, initial_students)
conn.commit()

# 5. პირველი 5 სტუდენტის გამოტანა ეკრანზე
print("პირველადი მონაცემები:")
cursor.execute("SELECT studentLastName, studentFirstName, studentAge FROM students")
rows = cursor.fetchall()

for row in rows:
    print(f"{row[0]:<17} {row[1]:<15} {row[2]}")

print("\n" + "-" * 45 + "\n")

# 6. კიდევ ერთი სტუდენტის დამატება (კახიძე კოტე, 27 წლის)
new_student = ('კოტე', 'კახიძე', 27)
cursor.execute(insert_query, new_student)
conn.commit()

# 7. მონაცემების დალაგება ანბანის მიხედვით (გვარი, სახელი) და გამოტანა
print("საბოლოო სახე:")
sort_query = """
SELECT studentLastName, studentFirstName, studentAge 
FROM students 
ORDER BY studentLastName ASC, studentFirstName ASC
"""
cursor.execute(sort_query)
final_rows = cursor.fetchall()

for row in final_rows:
    print(f"{row[0]:<17} {row[1]:<15} {row[2]}")

# კავშირის დახურვა
cursor.close()
conn.close()