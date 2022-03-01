def convertBinary(num):
    current = num
    binary = []
    finished = False
    while not finished:
        binary.append(current%2)
        current = current//2
        if current == 0:
            finished = True
    reverse = []
    for index in range(len(binary)):
        reverse.append(binary[len(binary)-1-index])
    print(num)
    print(reverse)

num = int(input("enter a digit "))
convertBinary(num)