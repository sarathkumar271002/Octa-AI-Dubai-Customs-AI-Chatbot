# Quick Start Guide - Multiple PDF Analysis API

## 🎯 What Was Created

A new Django REST API endpoint that processes **multiple PDF files** and returns **one merged JSON response**.

## 📍 API Endpoint

```
POST http://localhost:8000/api/trade-document/analyze-multiple-docling/
```

## 🚀 Quick Test

### Option 1: Using Python
```python
import requests

files = [
    ('files', open('invoice1.pdf', 'rb')),
    ('files', open('invoice2.pdf', 'rb'))
]

response = requests.post(
    'http://localhost:8000/api/trade-document/analyze-multiple-docling/',
    files=files
)

print(response.json())
```

### Option 2: Using cURL
```bash
curl -X POST \
  http://localhost:8000/api/trade-document/analyze-multiple-docling/ \
  -F "files=@invoice1.pdf" \
  -F "files=@invoice2.pdf" \
  -F "files=@delivery_order.pdf"
```

### Option 3: Using Test Script
```bash
# Edit test_multiple_pdf_api.py with your PDF paths, then run:
python test_multiple_pdf_api.py
```

## 📊 Response Preview

```json
{
  "total_files": 3,
  "successful_files": 2,
  "failed_files": 1,
  "merged_data": {
    "invoice_number": ["INV-001", "INV-002"],
    "shipper": {...},
    "consignee": {...},
    "items": [...]
  },
  "individual_results": [...]
}
```

## 🔧 Setup Requirements

1. **Install Docling:**
   ```bash
   pip install docling
   ```

2. **Install Tesseract OCR:**
   - **Ubuntu/Debian:** `sudo apt-get install tesseract-ocr`
   - **macOS:** `brew install tesseract`
   - **Windows:** Download from [GitHub](https://github.com/UB-Mannheim/tesseract/wiki)

3. **Start Django Server:**
   ```bash
   cd ai_training_platform
   python manage.py runserver
   ```

## 📁 Files Created/Modified

### Modified Files
- ✅ `ai_training_platform_app/view_ocr_trade_advisor.py` - Added API endpoint
- ✅ `ai_training_platform_app/urls.py` - Registered new route

### Documentation Files
- 📄 `MULTIPLE_PDF_API_USAGE.md` - Complete API documentation
- 📄 `API_IMPLEMENTATION_SUMMARY.md` - Technical implementation details
- 📄 `test_multiple_pdf_api.py` - Test script
- 📄 `QUICK_START.md` - This file

## 🎨 Processing Flow

```
┌─────────────────────────────────────────┐
│  Upload Multiple PDFs                   │
│  (file1.pdf, file2.pdf, file3.pdf)     │
└──────────────────┬──────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│  Validate Each File                     │
│  • Check file type (PDF only)           │
│  • Check file size (max 50MB)           │
└──────────────────┬──────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│  FOR EACH PDF:                          │
│  ┌───────────────────────────────────┐  │
│  │ 1. Save to Temp Directory         │  │
│  │ 2. OCR with Docling + Tesseract   │  │
│  │ 3. LLM Structured Extraction      │  │
│  │ 4. Store Individual Result        │  │
│  └───────────────────────────────────┘  │
└──────────────────┬──────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│  Merge All Extracted Data               │
│  • Combine arrays                       │
│  • Merge objects recursively            │
│  • Keep all unique information          │
└──────────────────┬──────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│  Return Single JSON Response            │
│  • Total/Successful/Failed counts       │
│  • Merged data from all PDFs            │
│  • Individual results for each PDF      │
└─────────────────────────────────────────┘
```

## 📋 Example Use Cases

### 1. Process Multiple Invoices
Upload all invoices from a shipment and get one consolidated record:
```python
files = [
    'commercial_invoice.pdf',
    'proforma_invoice.pdf',
    'tax_invoice.pdf'
]
```

### 2. Complete Shipment Documentation
Process all documents for customs clearance:
```python
files = [
    'bill_of_lading.pdf',
    'commercial_invoice.pdf',
    'packing_list.pdf',
    'certificate_of_origin.pdf',
    'delivery_order.pdf'
]
```

### 3. Scanned vs Digital Mix
Handles both scanned and digital PDFs:
```python
files = [
    'scanned_invoice.pdf',      # OCR will extract text
    'digital_packing_list.pdf'  # Direct text extraction
]
```

## ✨ Key Features

✅ **Multi-File Processing** - Handle multiple PDFs in one request  
✅ **Smart Data Merging** - Intelligently combine data from all files  
✅ **Individual Status** - Track success/failure for each file  
✅ **Robust Error Handling** - One failed file doesn't stop others  
✅ **High Accuracy OCR** - Docling + Tesseract for best results  
✅ **LLM Extraction** - AI-powered structured data extraction  
✅ **Automatic Cleanup** - Temp files are automatically removed  
✅ **Detailed Logging** - Track processing in Django logs  

## 🆚 Comparison with Existing API

| Feature | `/analyze/` | `/analyze-multiple-docling/` |
|---------|-------------|----------------------------|
| OCR Engine | PaddleOCR | Docling + Tesseract |
| Multiple PDFs | ✅ | ✅ |
| Data Merging | ✅ | ✅ |
| Based on | Production code | tes.py reference |
| Best For | General use | High-accuracy OCR |

## 🐛 Troubleshooting

### Error: "Docling not installed"
```bash
pip install docling
```

### Error: "Tesseract not found"
Install Tesseract OCR system package (see Setup Requirements above)

### Error: "OCR returned insufficient data"
- Check if PDF is valid and not corrupted
- Verify PDF contains text/images (not just blank pages)
- Check Tesseract installation

### Error: "Connection refused"
```bash
# Make sure Django server is running:
cd ai_training_platform
python manage.py runserver
```

## 📖 More Information

- **Full API Documentation:** See `MULTIPLE_PDF_API_USAGE.md`
- **Implementation Details:** See `API_IMPLEMENTATION_SUMMARY.md`
- **Test Script:** Run `test_multiple_pdf_api.py`

## 🎉 You're Ready!

1. ✅ Install dependencies (Docling + Tesseract)
2. ✅ Start Django server
3. ✅ Send PDF files to the API
4. ✅ Receive merged JSON response

**Example Test:**
```bash
python test_multiple_pdf_api.py
```

---

**Need Help?** Check the comprehensive documentation in `MULTIPLE_PDF_API_USAGE.md`
