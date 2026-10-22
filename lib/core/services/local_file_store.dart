// lib/core/services/local_file_store.dart
//
// Lớp trừu tượng hoá thao tác file cục bộ để cùng một code chạy được trên
// Android / iOS / Desktop (dart:io) và trên Web (không có hệ thống file).
//
// • Native  → local_file_store_io.dart   (File, Directory, HttpClient)
// • Web     → local_file_store_stub.dart (no-op; audio được phát trực tiếp từ máy chủ)
//
// Mọi file khác trong app CHỈ import file này, không import dart:io trực tiếp.

export 'local_file_types.dart';
export 'local_file_store_stub.dart'
    if (dart.library.io) 'local_file_store_io.dart';
