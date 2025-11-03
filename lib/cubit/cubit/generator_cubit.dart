import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagegenerator/dio_helper.dart';
part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit() : super(GeneratorInitial());
  static GeneratorCubit get(context) => BlocProvider.of(context);
  // DioHelper _dioHelper = DioHelper();
  Future<void> sendPrompt(String prompt) async {
    emit(SendPromptLoadingState());
    try {
      // _channel.sink.add(Prompt);
      var result = await DioHelper.postData(
        url: "image/generations",
        data: {
          "prompt": prompt,
          "style": "realistic",
          "aspect_ratio": "1:1",
          "seed": "5",
        },
        isFormData: true,
      );
      log(" ----------- ${result.data.toString()}");
      emit(SendPromptuccessState(Uint8List.fromList(result.data)));
    } catch (e) {
      emit(SendPromptErrorState());
    }
  }

  // Either<String, Stream<String>> getPrompts() {
  //   emit(GetPromptsLoadingState());
  //   try {
  //     emit(GetPromptsSuccessState());
  //     return Right(_channel.stream.map((msg) => msg.toString()));
  //   } catch (error) {
  //     emit(GetPromptsErrorState());
  //     return left(error.toString());
  //   }
  // }
}
