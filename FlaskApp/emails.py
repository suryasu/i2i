from flask.ext.mail import Message
from app import mail
from flask import render_template
from app import ADMINS

def send_email(subject, sender, recipients, text_bosy, html_body):
	msg = Message(subject, sender=sender, recipients=recipients)
	msg.body = text_body
	msg.html = html_body
	mail.send(msg)

def follower_notification(followed, follower):
	send_email("%s is now following you!")
