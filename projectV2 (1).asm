# Bismillahir Rahmanir Rahim
	# CAAL Project 
		#Group 
		# AHMAD SHIBBIR 			1824143
		# AHMED JOBAER 				1918243
		# SIDDIKI HASAN AL BANNA		1732003
		#MOHAMED LAHMED AHMEDOU			1711957

 
  .data 
 
       	layout1:		.asciiz "\t|---------------------------------------------------------|"
	helloMsg:		.asciiz "\n\t+\t\tWelcome to Smart Delivery System.\t  +\n"
	info:			.asciiz "\n\t\tPlease Provide Your Details.\n"
	userNMsg:		.asciiz "\n\t\tEnter your username: "
	passMsg:		.asciiz "\t\tEnter your password: "
	wrongMsg:		.asciiz "\n\t\tWrong User Name or Password. Re-enter please!!!!!!!"
	displayToStart:		.asciiz "\n\n\t\tDo you want to start journey?\n\t\t1. Start journey.\n\t\t0. Exit the program.\n\t\tEnter: "
	wrongOpt:		.asciiz "\t\tInvalid option. Choose valid one!!!\n"
	arrivingMsg:            .asciiz "\n\n\t\tYou are arrived in your destination.\n\n\t\tEnter Command to notify recipient.\n\t\t1. To Notify.\n\t\t0. Exit the program.\n\t\tEnter: "
	wait:			.asciiz "\n\t\tPlease wait until user come "
	notifyAgain:		.asciiz "\n\n\t\t1. If recipient came already.\n\t\t\2. Send notification again(If recipient not came until now).\n\t\t0. Exit the program.\n\t\tEnter: "
	OrderTest:		.asciiz "\n\t\t Order Process Testing"
	CashOn:                 .asciiz "\n\t\t Cash On delivery?"
	prePaid	:		.asciiz "\n\t\t Everything is Fine. You Can Deliver The Product."
	dot:			.asciiz "\t\t......"
	fiftyMtr:		.asciiz "\n\t\tYou are 50 meter away"
	Hundredmtr:		.asciiz "\n\t\tYou are 100 meter away"
	driveSafley:		.asciiz "\n\t\tYou Are Start Your Journey.\n\t\tPlease Deive Safley!"
	cashOnDelivery: 	.asciiz "\n\t\tThis is under cash on delivery. Take the money, deliver the percel and take the confirmation sign......."
	prepaidDelivery: 	.asciiz "\n\t\tDeliver the percel and take the confirmation sign.........."
	test: .asciiz "this is testing"
	confermation: 		.asciiz "\n\n\t\t1. If you have deliverd.\n\t\t0. Exit the program.\n\t\tEnter: "
	success: 		.asciiz "\n\n\t\tThank you!!!!! you have deliverd the product successfully!!!!!"
	receiverMsg: 		.asciiz "\n\t\tAsk and enter recepint name: "
	receiverMsg2: 		.asciiz "\t\tAsk and enter recepint order ID: "
	
	# Delivery Areas
	Area1: 			.asciiz "\n\t\tYour delivery area is UIA"
	Area2: 			.asciiz "\n\t\tYour delivery area is UTM"
	Area3: 			.asciiz "\n\t\tYour delovery area is UM"
	Area4: 			.asciiz "\n\t\tYour delovery area is UPM"
	
	# Delivary man Name
	user1:			.asciiz "Shibbir"
	user2:			.asciiz "Jobaer"
	user3:			.asciiz "Banna"
	user4:			.asciiz "Shafin"
	
	# Delivary man Password
	password1:		.word	1111
	password2:		.word	2222
	password3:		.word	3333
	password4:		.word	4444
	
	#Recipient Name	
	receiver1:		.asciiz "Mamun"
	receiver2:		.asciiz "Ehsan"
	receiver3:		.asciiz "Sajjad"
	receiver4:		.asciiz "Turjoy"
	
	#Order Id to recive parcel
	orderID1:		.word	5555
	orderID2:		.word	6666
	orderID3:		.word	7777
	orderID4:		.word	8888
	
	

	
	

	# To store user input				
	userName:		.space 10
	userName1:		.space 10
	receiverName:		.space 10
	receiverOrderID:	.space 10	
		
	
  .text

  
	# ---------display welcome message---------------------------//
	la	$a0, layout1			# This line is for loading the layout of welcoming in display
	jal	displayNotification		# jump and link to the display function.
	la	$a0, helloMsg			# Load Welcoming Message 
	jal	displayNotification		# Display Welcoming Message in console
	la	$a0, layout1			# Load 2nd Layout
	jal	displayNotification		# Display the 2nd Layout in console
	la	$a0, info			# Lode "Provide User info message
	jal	displayNotification		# Display User info message
	# ---------end of display welcome message---------------------------//



	#  ---------This is main function that will read and valided the delivary man name and their pasword ---------//
	# -------------------------------------------------------------------------------------------------------------
main:
	# display delivaryman name message
	la	$a0, userNMsg			
	jal	displayNotification		
	# read delivaryman name
	la	$a0, userName
	li	$a1, 11				
	jal	readStrInput			

	# print password message
	la	$a0, passMsg			
	jal	displayNotification		

	# read password from delivaryman
	jal	readIntInput			
	move	$t0, $v0			

	# -------------------------This Function will check delivaryman name.-----------------------/
	
	
	# ----------check delivaryman name and user input are equal or not, by calling stringCompare() function.------ 
	checkUser:
	la	$a0, user1			
	la	$a1, userName			 
	jal	stringCompare			# jump to the stringCompare() function. 
	beqz	$v0, checkPassword1		# if v0 equal to 0 , it will jump to the checkPassword1() function
	
	la	$a0, user2			
	la	$a1, userName			
	jal	stringCompare			# jump to the stringCompare() function. 
	beqz	$v0, checkPassword2		# if v0 equal to 0 , it will jump to the checkPassword2() function
	
	la	$a0, user3			
	la	$a1, userName			
	jal	stringCompare			# jump to the stringCompare() function. 
	beqz	$v0, checkPassword3		# if v0 equal to 0 , it will jump to the checkPassword3() function
	
	la	$a0, user4			
	la	$a1, userName			
	jal	stringCompare			# jump to the stringCompare() function. 
	beqz	$v0, checkPassword4		# if v0 equal to 0 , it will jump to the checkPassword4() function
	j	inValid				# otherwise  jump to inValid() function
	# ------------End of check delivarman name module.---------------------
	
	
	
	
	# this module will identify, is the password is correct or not acording to the delivaryman name.
checkPassword1:
	lw	$t1, password1			
	bne	$t0, $t1, inValid		# if password is not correct then deisplay invalid msg by calling inValid() function
	la 	$a0,Area1			# print area 1  name for this particular delivery man. 
	jal	displayNotification
	j 	choosToStatrt			# If the password is ccorrect jump to the choosToStatrt() Function.
	
checkPassword2:
	lw	$t1, password2			
	bne	$t0, $t1, inValid		# if password is not correct then deisplay invalid msg by calling inValid() function
	la 	$a0,Area2			# print area 2  name for this particular delivery man.
	jal	displayNotification
	j 	choosToStatrt			# If the password is ccorrect jump to the choosToStatrt() Function.
	
checkPassword3:
	lw	$t1, password3			
	bne	$t0, $t1, inValid		# if password is not correct then deisplay invalid msg by calling inValid() function
	la 	$a0,Area3			# print area 3  name for this particular delivery man.
	jal	displayNotification
	j 	choosToStatrt			# If the password is ccorrect jump to the choosToStatrt() Function.
	
checkPassword4:
	lw	$t1, password4			
	bne	$t0, $t1, inValid		# if password is not correct then deisplay invalid msg by calling inValid() function
	la 	$a0,Area4			# print area 4  name for this particular delivery man.
	jal	displayNotification
	j 	choosToStatrt			# If the password is ccorrect jump to the choosToStatrt() Function.
	


	#--------------------#
	# Start Journey
	#-------------------#								
choosToStatrt:          
	
	
	la	$a0, displayToStart		
	jal	displayNotification		# Print the start masg
		
		# get user value to start 
	jal	readIntInput
	move	$t0, $v0			# move choice into t0
	beq	$t0, 1, dotForStart		# if choice == 1 call dotForStart to process further action
	beq	$t0, 0, exit			# else if choice == 0 , exit the program.
	la	$a0, wrongOpt			# else print, wrong input
	jal	displayNotification		
	j	choosToStatrt			# jump on choosToStatrt

	
	#---this function will sleep for few second and print some dot continiously.---------	
dotForStart:
	li $s6,0
	li $s7,1
	la	$a0, driveSafley
	jal	displayNotification
			
	li 	$t7,0
	jal	dotPrint		# print some dot
	

HundredmtrDot:	
	la	$a0, Hundredmtr		# print "you are 50 meter away
	jal	displayNotification
	
	li 	$t7,0
	jal	dotPrint		# print some dot
													
fiftyMtrDot:
	la	$a0, fiftyMtr         # print "you are 50 meter away
	jal	displayNotification
	
	li 	$t7,0
	jal	dotPrint		# print some dot
	###---End of dot print and sleep moudule---------###
	
			
	
	##### this Function will notify the recipient and print arrivig msg    ######
start:

	la	$a0, arrivingMsg
	jal	displayNotification
	
		# get option from the user
	jal	readIntInput
	move	$t0, $v0			# move choice into t0
	beq	$t0, 1, notifyRecipient		# if t0 == 1 then notify recipient
	beq	$t0, 0, exit			# else if choice == 0 , exit the program.
	la	$a0, wrongOpt			# else print, wrong input
	jal	displayNotification		
	j	start				# jump to start function again
	
	
	
notifyRecipient	:
	la	$a0, wait
	jal	displayNotification
					
        la	$a0, notifyAgain  		#if recipient did not come, display to notyfy again 
	jal	displayNotification				
		
		
	# read option from user
	jal	readIntInput
	move	$t0, $v0			
	beq	$t0, 1, OrderProcess		# if choice == 1 goto door status
	beq	$t0, 2, start
	beq	$t0, 0, exit			# else if choice == 6 goto exit and program will finish executing.
	la	$a0, wrongOpt			# else print wrong option message. And go back to main menu
	jal	displayNotification		
	j	notifyRecipient			# jump to choosToStatrt() function

	

	
	OrderProcess:
	# display masg to get recipient name
	la	$a0, receiverMsg			
	jal	displayNotification		

	# get recipient name  
	la	$a0, receiverName
	li	$a1, 11				
	jal	readStrInput			# Jump to the readStrInput() and Link it.
	
	# print password message
	la	$a0, receiverMsg2		
	jal	displayNotification		

	# read password from user
	jal	readIntInput			
	move	$t0, $v0			

	# This Function will check user name.
	checkReceiver1:
	la	$a0, receiver1			
	la	$a1, receiverName			
	jal	stringCompare			# jump to the stringCompare() function.
	beqz	$v0, checkOrderID1		# if v0 equal to 0 , it will jump to the checkOrderID1() function
	
	checkReceiver2:
	la	$a0, receiver2			
	la	$a1, receiverName			
	jal	stringCompare			# jump to the stringCompare() function.
	beqz	$v0, checkOrderID2		# if v0 equal to 0 , it will jump to the checkOrderID2() function
	
	checkReceiver3:
	la	$a0, receiver3			
	la	$a1, receiverName			
	jal	stringCompare			# jump to the stringCompare() function.
	beqz	$v0, checkOrderID3		# if v0 equal to 0 , it will jump to the checkOrderID3() function
	
	checkReceiver4:
	la	$a0, receiver4			
	la	$a1, receiverName			 
	jal	stringCompare			# jump to the stringCompare() function.
	beqz	$v0, checkOrderID4		# if v0 equal to 0 , it will jump to the checkOrderID4() function
	j	inValid				# otherwise  jump to inValid() function


	# This function will Check Order ID
checkOrderID1:
	lw	$t1, orderID1			
	bne	$t0, $t1, reciverInValid	# if password is not correct then deisplay invalid msg by calling reciverinValid() function	
	la 	$a0,cashOnDelivery
	jal	displayNotification		
	j 	Delivary			# If the password is ccorrect jump to the Delivary() Function
	
checkOrderID2:
	lw	$t1, orderID2			
	bne	$t0, $t1, reciverInValid	# if password is not correct then deisplay invalid msg by calling reciverinValid() function		
	la 	$a0,prepaidDelivery
	jal	displayNotification
	j 	Delivary			# If the password is ccorrect jump to the Delivary() Function	
	
checkOrderID3:
	lw	$t1, orderID3			
	bne	$t0, $t1, reciverInValid	# if password is not correct then deisplay invalid msg by calling reciverinValid() function		
	la 	$a0,cashOnDelivery
	jal	displayNotification
	j 	Delivary			# If the password is ccorrect jump to the Delivary() Function	
	
checkOrderID4:
	lw	$t1, orderID4			
	bne	$t0, $t1, reciverInValid	# if password is not correct then deisplay invalid msg by calling reciverinValid() function		
	la 	$a0,prepaidDelivery
	jal	displayNotification
	j 	Delivary			# If the password is ccorrect jump to the Delivary() Function

	
Delivary:	
	
	la	$a0, confermation			
	jal	displayNotification		# Print the display menu.
		
	# read option from user
	jal	readIntInput
	move	$t0, $v0			
	beq	$t0, 1, SuccessMsg		# if choice equal to 1 goto success mgs
	beq	$t0, 0, exit			# else if choice equal to 0 goto exit and program will finish executing.
	la	$a0, wrongOpt			# else go to wronginput() fuction and ask correct input to enter
	jal	displayNotification		
	j	Delivary			
	

	SuccessMsg:
	la	$a0, success			#load success msg
	jal	displayNotification

	
	#exit the program	
exit:
	li	$v0, 10
	syscall




	
inValid:
	# display invalid message 
	la	$a0, wrongMsg
	jal	displayNotification
	j	main	# jump to the main function

reciverInValid:
	# display invalid message for the OrderProcess module.
	la	$a0, wrongMsg
	jal	displayNotification
	j	OrderProcess	# jump to the OrderProcess
	
	
	# all massege will display by using this function.
displayNotification:
	li	$v0, 4
	syscall
	jr	$ra	#jump back
	
	# This function will use to read all integer value.
readIntInput:
	li	$v0, 5
	syscall	
	jr	$ra   #jump back

	# This function will use to read all string value.
readStrInput:
	li	$v0, 8
	syscall	
	jr	$ra	#jump back
	

	
	# this function compare two string if both strings are equal then $v0 = 0	
stringCompare:
	add	$s0,$zero,$zero 	# s0 equal to 0
	add	$s1,$zero,$a0 		# s1 equal to  first string address
	add	$s2,$zero,$a1 		# s2 equal to second string address
loop:
	lb	$s3,0($s1) 		# load a byte from string 1
	lb	$s4,0($s2) 		# load a byte from string 2
	beq	$s3, 10, returnStrCmp	# Return the value to stringCompare() Function
	beqz	$s3, returnStrCmp
	bne	$s3, $s4, setMinusOne 		
	li	$v0, 0
	j	nextChars

setMinusOne:
	li	$v0, -1

nextChars:
	addi	$s1,$s1,1 		# s1 points to the next byte of str1
	addi	$s2,$s2,1
	j	loop
returnStrCmp:
	jr	$ra
	
	#This fumction will print dot.	
	dotPrint:
	la	$a0, dot			
	jal	displayNotification
	jal 	sleep
	add 	$t7,$t7,1
	blt 	$t7,3,dotPrint
	add	$s6,$s6 ,$s7
	beq 	$s6,1,HundredmtrDot
	beq 	$s6,2,fiftyMtrDot
	j	start
	
	
	# to delay some time we use sleep() function	
	sleep: 
	li 	$v0,32
	la 	$a0,1000
	syscall
	
	jr	$ra
