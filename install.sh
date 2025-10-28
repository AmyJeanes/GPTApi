set -e

python3.14 -m pip install --no-cache-dir -r requirements.txt
python3.14 -m pip install torch==2.9.0+cpu --index-url https://download.pytorch.org/whl/cpu
