import string

def val(num_ber):
    value={'0':0, '1':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, 'A':10, 'B':11, 'C':12, 'D':13, 'E':14, 'F':15, 'G':16, 'H':17, 'I':18, 'J':19, 'K':20, 'L':21, 'M':22, 'N':23, 'O':24, 'P':25, 'Q':26, 'R':27, 'S':28, 'T':29, 'U':30, 'V':31, 'W':32, 'X':33, 'Y':34, 'Z':35}
    return value[num_ber]


def convert(number,base):
    num=0
    i=len(number)-1
    while i>=0:
        if number[i]=='-':
            print '-',
            i=i-1
            continue
        if val(number[i])>=base:
            print "Invalid number"
            return -1
        num += val(number[i]) * base**(len(number)-i-1)
        i=i-1
    return num


x= raw_input("Enter the number:")
y= input("Enter the base:")

integ_part, point, fraction_part= x.strip().partition('.')
num= (convert(integ_part+fraction_part,y))*(y**(-len(fraction_part)))
if num>0:
    print num


