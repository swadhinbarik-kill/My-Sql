# strings used as " " or ''

x = "micheal jackson"
print(x[::2])


# escape sequences  \n \t \\
# string manipulation 
print("before:",x)
y = x.upper()
print("after:",y)
z = x.replace("jackson","raj")
print("replaced:",z)

# find 
print(x.find('jack'))

name = "sadafaka"
split_string = (name.split('a',1))
print(split_string)