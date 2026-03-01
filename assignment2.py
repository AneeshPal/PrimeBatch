# #q1
# salary=int(input("enter the salary :"))

# if(salary<30_000):
#     rate="5%"
# elif(salary>=30_000 and salary<=70_000):
#     rate="15%"
# else:
#     rate="25%"
# print("final tax rate=",(rate))

# #q2

# a=int(input("enter the lower range value:"))
# b=int(input("enter the upper range value:"))

# for num in range(a,b+1):
#     if(num%2==0):
#         print(num)


# #q3

# def func(num):
#     while(num>0):
#         rem=num%10
#         print(rem)
#         num=num//10

# num=int(input("enter the number:"))
# func(num)

#q4

# def cnt(num):
#     cnt=0
#     while(num>0):
#         cnt=cnt+1
#         num=num//10
#     return cnt

# num=int(input("enter the number:"))
# result=cnt(num)
# print(f"number of digit in {num}={result}")


#q5


# def cnt(num):
#     sum=0
#     while(num>0):
#         rem=num%10
#         sum=sum+rem
#         num=num//10
#     return sum

# num=int(input("enter the number:"))
# print(f"sum of digits in {num} ={cnt(num)}")

#q6

# for i in range(1,100):
#     if(i %3==0 or i%5==0):
#         print(i)


#q7

# num=int(input("enter the number:"))
# choice=""
# while(choice!="Quit"):
#     if(num<0):
#         print("Negative number")
#     else:
#         print("Positive number")    
#     choice=input("if you want to stop then write quite otherwise anything \n")       
#     num=int(input("enter the number:"))
    

# #q8

# def calculator(a,b,operation):
    
#     return res

# print(calculator(6, 7, '+'))


#q9

# def prime(num):
#     for i in range(2,num):
#         if(num%i==0):
#             return False
#         else:
#             return True

# num=int(input("enter the number:"))
# print(prime(num))           
          

#q10

# num=int(input("enter the number "))
# choice=""
# while( choice!="Quit"):
#     guess=int(input("Guess the number:"))
#     if(guess==num):
#         break
#     if(guess>num):
#         print("Too high")
#     else:
#         print("Too low")
#     choice=input("input Quit to stop the guessing game\n")
  