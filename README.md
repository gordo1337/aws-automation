#######################################################
# This is an automation of a project i did in school. # 
#######################################################
#  The Description goes like this :                   #
#######################################################
#{---------------------------------------------------}#
#               Project description                   #
#{---------------------------------------------------}#
#   An organization wants to                          #   
#   set-up a cloud environment in                     #
#   AWS.                                              # 
#   The organization wants to have its own            #
#   Amazon Virtual                                    # 
#   Private Cloud (VPC)                               #  
#   to isolate itself from the rest of                #  
#   Amazon Web Services                               #
#   and ensure the organization’s                     #
#   services are running in                           #
#   their own private network.                        #
#   Moreover, the organization wants to have three    #
#   separate                                          #
#   subnets called Finance,                           #   
#   and IT corresponding to                           # 
#   the two departments in the                        #
#   organization.                                     # 
#   A single Amazon EC2 instance is required in each  #
#   subnet.                                           #
#   The finance EC2 instance should not be accessible #
#   external while the IT subnet instance             #
#   should be accessible on port                      #
#   80 and requires Amazon Elastic IP.                #
#   You are asked to help the organization            #
#   to automate the set-up process using a            #
#   shell script and                                  #
#   write a short report about                        #
#   your solution and the                             #
#   steps to run your script.                         #
#   }                                                 #
#######################################################
#{---------------------------------------------------}#
# This is the Lazyguy way of laynching the script =   #
#{---------------------------------------------------}#
#######################################################
#{---------------------------------------------------}#
# 1. sudo bash lazyfucker.sh                          #
#    This will first make the directory .aws ,        #
#    then it will touch the file credentials.         #
#{---------------------------------------------------}#
#######################################################
#  2.                                                 #
#     in the first script that is runned in           #
#     lasyfucker.sh --> mkdir.sh                      #
#     A command is launched in the end                #
#     that makes an output =                          #
#{---------------------------------------------------}#
#     "Insert key here"                               #
#{---------------------------------------------------}#
#      where you can input your aws cli  key.         #
#{---------------------------------------------------}#
#######################################################
#                                                     #
#  3. then it runs run.sh ( the grand solution        #
#     of automating this project.                     #
#{---------------------------------------------------}#
#######################################################
