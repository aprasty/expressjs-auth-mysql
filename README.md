# expressjs-auth-mysql
# Register 
localhost:3000/api/v1/users/register      Method: POST

{   
    "name":"Admin",
    "email": "admin@testing.com", 
    "password": "admin"
}

---------------------------------------------------------------------------------
#Login 
localhost:3000/api/v1/users/login      Method: POST

{   
    "email": "admin@test.com", 
    "password": "admin"
}

------------------------------------------------------------------------------------
#Token
localhost:3000/api/v1/token         Method POST
{   
    "secret": "7f46165474d11ee5836777d85df2cdab", 
    "token": "c88122189463ff94e2036947e9dc7b73f86bcc9d0c96cc919d1c176d3ae87732"
}

RESULT

#Cek Token
localhost:3000/api/v1/token/check     Method: POST

{   
     "token": "7277fb622b95e42bace370a01932cab48970dcfd26bd9ad087",
    "user_token":"c88122189463ff94e2036947e9dc7b73f86bcc9d0c96cc919d1c176d3ae87732"
}
