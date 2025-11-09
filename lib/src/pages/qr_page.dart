import 'package:flutter/material.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  bool _showCamera = false;
  bool _isProcessing = false;
  String? _scannedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_showCamera) {
              setState(() {
                _showCamera = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Absensi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _showCamera ? _buildCameraView() : _buildMapView(),
      bottomNavigationBar: _showCamera ? null : _buildBottomNav(),
    );
  }

  Widget _buildMapView() {
    return Stack(
      children: [
        // Map Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/image/bgabsen1.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.map, size: 100, color: Colors.grey),
                ),
              );
            },
          ),
        ),

        // Profile Card at Top
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad Reno',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Senior • Kapster',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Foto Outlet Button
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _showCamera = true;
                });
              },
              icon: const Icon(Icons.camera_alt, size: 20),
              label: const Text(
                'Foto Outlet',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCameraView() {
    return Stack(
      children: [
        // Camera Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/image/bgabsen2.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.camera_alt, size: 100, color: Colors.white38),
                ),
              );
            },
          ),
        ),

        // Dark overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),

        // Profile Card at Top
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad Reno',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Senior • Kapster',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // QR Scanner Overlay
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                // Corner decorations
                ...List.generate(4, (index) {
                  return Positioned(
                    top: index < 2 ? 0 : null,
                    bottom: index >= 2 ? 0 : null,
                    left: index % 2 == 0 ? 0 : null,
                    right: index % 2 == 1 ? 0 : null,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          top: index < 2
                              ? const BorderSide(color: Colors.blue, width: 4)
                              : BorderSide.none,
                          bottom: index >= 2
                              ? const BorderSide(color: Colors.blue, width: 4)
                              : BorderSide.none,
                          left: index % 2 == 0
                              ? const BorderSide(color: Colors.blue, width: 4)
                              : BorderSide.none,
                          right: index % 2 == 1
                              ? const BorderSide(color: Colors.blue, width: 4)
                              : BorderSide.none,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),

        // Instruction Text
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: const Text(
            'Tempatkan QR Code dalam area ini',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Capture Button
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _isProcessing ? null : _simulateScan,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
                child: _isProcessing
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      )
                    : const Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                        size: 32,
                      ),
              ),
            ),
          ),
        ),

        // Loading overlay
        if (_isProcessing)
          Positioned.fill(
            child: Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Memproses absensi...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, false),
          _buildNavItem(Icons.person, false),
          _buildNavItem(Icons.qr_code_scanner, true),
          _buildNavItem(Icons.history, false),
          _buildNavItem(Icons.settings, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  void _simulateScan() {
    setState(() {
      _isProcessing = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _scannedData = 'QR-ABSEN-${DateTime.now().millisecondsSinceEpoch}';
        _isProcessing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Absensi berhasil: $_scannedData'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    });
  }
}