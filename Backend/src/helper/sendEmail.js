const nodemailer = require('nodemailer');


function sendMail(email, subject, text ,htmlContent) {
	let mailOptions;
    const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
            user: process.env.SMTP_USERNAME,
            pass: process.env.SMTP_PASSWORD
        }
    });

	if(text === null)
	{
		mailOptions = {
			from: process.env.SMTP_USERNAME,
			to: email,
			subject: subject,
			html:htmlContent
		}
	}else{
		mailOptions = {
			from: process.env.SMTP_USERNAME,
			to: email,
			subject: subject,
			text: text,
		}
	}
    

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log("Done");
        }
    });

}

module.exports = sendMail;