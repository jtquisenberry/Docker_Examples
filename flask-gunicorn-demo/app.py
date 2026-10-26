from flask import Flask
import html
import platform
import socket

app = Flask(__name__)


@app.route("/")
def hello_world():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    linux_version = platform.freedesktop_os_release()["PRETTY_NAME"]
    python_version = platform.python_version()

    return (
        "<p>Hello, World!</p><br>"
        f"Hostname: {html.escape(hostname)}<br>"
        f"IP address: {html.escape(ip_address)}<br>"
        f"Linux version: {html.escape(linux_version)}<br>"
        f"Python version: {html.escape(python_version)}"
    )