# PoC: Ransomware-Like File Encryption Using 7-Zip Password-Protected Archives

This repository contains a **Proof of Concept (PoC)** demonstrating a simple ransomware behavior using batch scripts and 7-Zip. The scripts encrypt files and folders on the desktop by compressing them into password-protected `.lol` archives, then delete the original files/folders. A complementary script decrypts (extracts) the archives and restores the files.

> **⚠️ WARNING:**  
> This is a PoC intended for educational purposes only.  
> Do **NOT** use on important data or systems without explicit permission.  
> Understand risks before running any script that deletes files.

---

## Scripts

### 1. `encrypt.bat`

- Zips **folders and files** on the desktop into password-protected `.lol` archives using AES-256 encryption  
- Password is set in the script (`test123` by default)  
- After successful compression, deletes the original files/folders

**How it works:**  
- Iterates over all folders and files on the desktop  
- Creates `.lol` archives with password protection  
- Removes original files/folders to simulate ransomware behavior  

---

### 2. `decrypt.bat`

- Extracts all `.lol` archives from the desktop using the predefined password  
- Restores the original files/folders  
- Deletes the `.lol` archives after extraction

**How it works:**  
- Finds all `.lol` archives on the desktop  
- Creates a folder named after each archive and extracts files into it  
- Deletes the archive to clean up  

---

## Usage

1. Place `encrypt.bat` and `decrypt.bat` on your machine.  
2. Run `encrypt.bat` to encrypt desktop files/folders into password-protected archives and delete originals.  
3. Run `decrypt.bat` to restore files from archives and remove `.lol` files.  

---
## Detection Status

As of the upload date (2025-05-28), this PoC is **fully undetected** by antivirus engines on VirusTotal:  
[0/60 detection ratio on VirusTotal](https://www.virustotal.com/gui/file-analysis/OWNlYmZkZmY3NWU2ZGIyODRlYzVmZGJlNTZiMjlkNzM6MTc0ODQ2NDk1Mw==)

---

## Important Notes

- The scripts use a **hardcoded password** (`test123`) for demonstration only.  
- File/folder deletion is **permanent** unless backups exist.  
- The archive extension `.lol` is arbitrary and can be changed.  
- Designed as a minimal ransomware behavior simulation — lacks real-world ransomware complexity (e.g., communication with C2 servers, persistence).

---

## Disclaimer

This project is for **educational and research purposes only**.  
The author is **not responsible** for any misuse or damage caused by these scripts.  
Always test in a controlled environment.


