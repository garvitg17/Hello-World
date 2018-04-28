function formValidation()
{
var uname = document.registration.username;
var uadd = document.registration.address;
var uemail = document.registration.email;
var umob = document.registration.mob;
var ubank = document.registration.bankacc;
var passid = document.registration.passid;





 if(allLetter(uname,20))
{
if(max(uadd))
{
if(ValidateEmail(uemail))
{
if(allnumeric_mob(umob))
{ 
if(allnumeric_bank(ubank))
{
if(passid_validation(passid,20))
{
}
} 
}
}
}
}
return false;

}
function passid_validation(passid,my)
{
var letters = /^[0-9a-zA-Z]+$/;	
var passid_len = passid.value.length;
if ((passid_len == 0 ||passid_len > my) && !(passid.value.match(letters)))
{
alert("Invalid Password");
passid.focus();
return false;
}
else{
alert('Form Succesfully Submitted');
window.location.reload()
return true;
}
}
function allLetter(uname,mx)
{ 
var uname_len = uname.value.length;	
var letters = /^[A-Za-z ]+$/;
if((uname.value.match(letters)) && (uname_len <= 20))
{
return true;
}
else
{
alert('Invalid Name');
uname.focus();
return false;
}
}
function max(uadd)
{ 
var uadd_len = uadd.value.length;	

if((uadd_len <= 100))
{
return true;
}
else
{
alert('Invalid User address');
uadd.focus();
return false;
}

}
function allnumeric_mob(umob)
{
var umob_len = umob.value.length;	
var numbers = /^[0-9]+$/;
if(umob.value.match(numbers) && (umob_len == 10))
{
return true;
}
else
{
alert('Invalid Mobile No.');
umob.focus();
return false;
}
}
function allnumeric_bank(ubank)
{
var ubank_len = ubank.value.length;	
var numbers = /^[0-9]+$/;
if(ubank.value.match(numbers) && ubank_len == 5)
{
return true;
}
else
{
alert('Invalid Bank Account No.');
ubank.focus();
return false;
}
}
function ValidateEmail(uemail)
{
var mailformat = /^[A-Za-z]+([\.-]?[A-Za-z]+)*@\w+([\.-]?\w+)*(\.com)+$/;
if(uemail.value.match(mailformat))
{
return true;
}
else
{
alert("Invalid Email Address!");
uemail.focus();
return false;
}
}