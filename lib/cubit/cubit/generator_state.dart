part of 'generator_cubit.dart';

sealed class GeneratorState {}

final class GeneratorInitial extends GeneratorState {}

class InitState extends GeneratorState {}

class GetPromptLoadingState extends GeneratorState {}

class GetPromptSuccessState extends GeneratorState {}

class GetPromptErrorState extends GeneratorState {}

class SendPromptLoadingState extends GeneratorState {}

class SendPromptuccessState extends GeneratorState {
  SendPromptuccessState(this.imageBytes);
  Uint8List imageBytes;
  // final String image;
}

class SendPromptErrorState extends GeneratorState {}
