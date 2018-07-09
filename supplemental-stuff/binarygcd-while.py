#binarygcd-while.py
#              Extended Binary GCD (Binary "Pulverizer")

def binarygcd(a, b):               #a, b > 0
       # returns gcd(a,b) and coefficients ux,vx such that
       # gcd(a,b) = (ux, vx) dot (a, b)
    x, y, e = a, b, 1
    while  evenp(x) and evenp(y):   #x=a/e, y=b/e
        x, y, e = x//2, y//2, 2*e
    ux, vx, uy, vy = 1, 0, 0, 1
    while (x != y):                #x, y not both even
                                   #x = (ux, vx) dot (a/e, b/e)
                                   #y = (uy, vy) dot (a/e, b/e)
       if evenp(x):
           x = x//2
           if evenp(ux) and evenp(vx):
               ux, vx = ux//2, vx//2
           else:          #ux-b/e and vx+a/e are even
               ux, vx = (ux - b//e)//2, (vx + a//e)//2
       elif evenp(y):
           x, ux, vx, y, uy, vy = y, uy, vy, x, ux, vx  #switch x and y
       elif x > y:
           x, ux, vx = x-y, ux-uy, vx-vy
       else:              #x < y:
           x, ux, vx, y, uy, vy = y, uy, vy, x, ux, vx  #switch x and y
    #x == y
    print("gcd =", e*x, " a =", a, " b =", b, " ux =", ux, " vx =", vx)
    return "done"

def evenp(n):
    return n%2 == 0

#========================

#>>> binarygcd(3, 5)
#gcd = 1  a = 3  b = 5  ux = 2  vx = -1
#'done'

#>>> binarygcd(2**3, 2**5)
#gcd = 8  a = 8  b = 32  ux = -3  vx = 1

#>>> binarygcd(2**13 * 3**2 * 5 * 7 * 13**2,  2**4 * 5**4 * 11**5)
#gcd = 80  a = 436101120  b = 1610510000  ux = -79611116  vx = 21557455

def dot(a, b, u, v):
    return u*a+v*b

#>>> dot(436101120, 1610510000, -79611116, 21557455)
#80

