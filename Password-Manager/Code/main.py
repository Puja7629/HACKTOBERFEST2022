from random import randint, choice, shuffle
from tkinter import *
from tkinter import messagebox
import pyperclip
import json


def generate_password():
    letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
               'v',
               'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
               'R',
               'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']

    password_letters = [choice(letters) for _ in range(randint(8, 10))]
    password_numbers = [choice(numbers) for _ in range(randint(2, 4))]
    password_symbols = [choice(symbols) for _ in range(randint(2, 4))]

    random_password = password_letters + password_symbols + password_numbers
    shuffle(random_password)

    new_password = "".join(random_password)
    password_text.insert(END, new_password)
    pyperclip.copy(new_password)


def add():
    site = website_text.get("1.0", 'end-1c')
    site_email = email_text.get("1.0", 'end-1c')
    site_password = password_text.get("1.0", 'end-1c')
    new_data = {
        site: {
            "Email": site_email,
            "Password": site_password,
        }
    }

    if len(site) == 0 or len(site_password) == 0:
        messagebox.askretrycancel(title="Empty Field Detected", message="Empty Field/s Not Allowed!")
    else:
        try:
            with open('data.json', 'r') as data_file:
                data = json.load(data_file)
        except(FileNotFoundError, json.decoder.JSONDecodeError):
            with open('data.json', 'w') as data_file:
                json.dump(new_data, data_file, indent=4)
        else:
            data.update(new_data)
            with open('data.json', 'w') as data_file:
                json.dump(data, data_file, indent=4)
        finally:
            website_text.delete("1.0", END)
            password_text.delete("1.0", END)


def search():
    search_site = website_text.get("1.0", "end-1c")
    try:
        with open('data.json', 'r') as data_file:
            data = json.load(data_file)
    except FileNotFoundError:
        messagebox.showinfo(title='Error', message='No file found!')
    else:
        if search_site in data:
            email_account = data[search_site]["Email"]
            account_password = data[search_site]["Password"]
            messagebox.showinfo(title=search_site, message=f"Email: {email_account}\nPassword: {account_password}")
        else:
            messagebox.showinfo(title='Error', message=f'No details for {search_site} exists.')


# ---------------------------- UI SETUP ------------------------------- #
window = Tk()
window.title("MyPass Password Manager")
window.config(height=500, width=500, padx=50, pady=50)
window.iconbitmap("logo.ico")

canvas = Canvas(width=200, height=200)
logo_image = PhotoImage(file="logo.png")
canvas.create_image(100, 100, image=logo_image)
canvas.grid(column=1, row=1, padx=20, pady=20)

# Labels
website = Label(text="Website: ", font=("Times New Roman", 10))
website.grid(column=0, row=2, padx=10, pady=5)
email = Label(text="Email/Username: ", font=("Times New Roman", 10))
email.grid(column=0, row=3, padx=10, pady=5)
password = Label(text="Password: ", font=("Times New Roman", 10))
password.grid(column=0, row=4, padx=10, pady=5)

# Texts
website_text = Text(width=22, height=1)
website_text.grid(column=1, row=2, columnspan=1)
website_text.focus()
email_text = Text(width=35, height=1)
email_text.grid(column=1, row=3, columnspan=3)
email_text.insert(END, "ranaharshvardhan52@gmail.com")
password_text = Text(width=22, height=1)
password_text.grid(column=1, row=4, columnspan=1)

# Buttons
generate = Button(text="Generate", font=("Times New Roman", 10), width=10, command=generate_password)
generate.grid(column=2, row=4, columnspan=1)
add_button = Button(text="Add", font=("Times New Roman", 10), width=40, command=add)
add_button.grid(column=1, row=5, padx=5, pady=5, columnspan=2)
search_button = Button(text="Search", font=("Times New Roman", 10), width=10, command=search)
search_button.grid(column=2, row=2, columnspan=1)

window.mainloop()
