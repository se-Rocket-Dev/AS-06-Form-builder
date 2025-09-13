# flutter_form_builder
<img width="760" height="1414" alt="image" src="https://github.com/user-attachments/assets/9d11301e-bdd7-4382-b13b-6ff3ddeff30e" />
<img width="678" height="1366" alt="image" src="https://github.com/user-attachments/assets/6c30a9b6-a821-49e6-af03-20a3c3f4840a" />
<img width="752" height="1402" alt="image" src="https://github.com/user-attachments/assets/2496734d-2843-40fb-9f28-04e860d58a7c" />
<img width="746" height="1418" alt="image" src="https://github.com/user-attachments/assets/95487f53-3d1d-4052-8fb7-bd159b7e1f4e" />


## 📖 Overview
แอพนี้แสดงการใช้งาน **[`flutter_form_builder`](https://pub.dev/packages/flutter_form_builder)** และ **[`form_builder_validators`](https://pub.dev/packages/form_builder_validators)**  
สำหรับสร้างฟอร์มที่มีการตรวจสอบข้อมูล (validation) ครบถ้วน พร้อม UI ที่สวยงามตาม **Material Design 3**

---

## ✨ Features
- ✅ ฟอร์มกรอกข้อมูลที่หลากหลาย (TextField, Email, Phone, Password, Dropdown, Checkbox, Radio, Date, Time)  
- ✅ ระบบตรวจสอบข้อมูลอัตโนมัติ (Validation) เช่น:
  - อีเมลต้องถูกต้อง
  - รหัสผ่าน >= 8 ตัวอักษร และมี uppercase, lowercase, ตัวเลข, special character
  - อายุ >= 18
- ✅ ปุ่ม **Submit Form** และ **Reset Form**  
- ✅ แสดง Dialog เมื่อฟอร์มส่งสำเร็จ  
- ✅ UI ใช้ **Material 3** (ColorScheme จาก seed color)

---

## 🛠️ Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_form_builder: ^9.2.1
  form_builder_validators: ^9.0.0
  intl: ^0.19.0
