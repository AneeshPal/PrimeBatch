
# #q1
# def check_palindromic(s):
#     s_length=len(s)

#     for i in range(0,(s_length//2+1)):
#         if(s[i]!=s[s_length-i-1]):
#             return False

#     return True         
        

# s=input("Enter the string :")
# result=check_palindromic(s)

# if(result==True):
#     print("palindrome")
# else:
#     print("Not a palindrome")


# #q2

# ls=(1,2,3,4,5,6)
# l=len(ls)
# sum=0
# for i in range(0,l):
#     sum=sum+ls[i]

# avg=sum/l
# print(avg)


# #q3
# ls1=[1,2,7]
# ls2=[2,4,5]
# result=[]

# for el in ls1:
#     result.append(el)

# for el in ls2:
#     result.append(el)

# result.sort()

# print(result)

# #q4

# tup=(1,2,3,4,5,6,7,8,9,10)
# even_tup=()
# odd_tup=()
# for el in tup:
#     if(el%2==0):
 

 #q5


#  #q6
# words=["banana","apple","litchi","kiwi","cherry","mango"]
# dic={}

# for wrd in words:
#     dic.update({wrd:len(wrd)})

# print(dic)


# #q7

# sent=input("enter the sentence:\n")
# cnt=0
# for i in range(0,len(sent)):
#     if(sent[i]==' '):
#         cnt=cnt+1
# print("Total Spaces in sent=",cnt)


# #q8

# ls1=[1,2,3,4]
# ls2=[2,6,7,8]
# st=set()

# for el in ls1:
#     st.add(el)
# for el in ls2:
#     st.add(el)

# if(len(ls1)+len(ls2)==len(st)):
#     print("No Common Elements")
# else:
#     print("Common Elements")


# #q9

# ls=[1,2,2,3,4,5,6,4,4]
# print(ls)
# st=set()

# for el in ls:
#     st.add(el)

# print(st)


# #q10

# inp=input("enter the string ")
# st=set()

# for ch in inp:
#     st.add(ch)

# print("Unique Element",st)
# print("Count of unique elements=",len(st))