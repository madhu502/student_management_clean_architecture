class AuthState {
  final bool isLoading;

  final String? error;

  final String? imageName;

  final String? token;

  AuthState({required this.isLoading, this.error, this.imageName, this.token});

  factory AuthState.initial() => AuthState(
        isLoading: false,
        error: null,
        imageName: null,
        token: null,
      );

  AuthState copyWith({
    bool? isLoading,
    String? imageName,
    String? error,
    String? token,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      token: token ?? this.token,
    );
  }
}