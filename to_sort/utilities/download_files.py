import gdown
import time

# File 1: lind_micro.tar.gz
url_1 = "https://drive.google.com/uc?id=1w6WsojPh4oAZMVkqXmwmh-_U6Qt6dLbJ"
output_1 = "native_lamp_stack.tar.gz"
max_retries = 10

for attempt in range(max_retries):
    try:
        gdown.download(url_1, output_1, quiet=False, resume=True)
        print("Download succeeded!")
        break
    except Exception as e:
        print(f"Attempt {attempt + 1} failed with error: {e}")
        if attempt < max_retries - 1:
            time.sleep(2)  # Add a small delay before retrying
        else:
            print("Download failed after 5 attempts.")