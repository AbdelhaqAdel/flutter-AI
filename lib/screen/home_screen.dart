import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagegenerator/cubit/cubit/generator_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneratorCubit(),
      child: BlocConsumer<GeneratorCubit, GeneratorState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: BlocBuilder<GeneratorCubit, GeneratorState>(
                    builder: (context, state) {
                      if (state is SendPromptuccessState) {
                        return Container(
                          width: double.maxFinite,

                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(state.imageBytes),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          color: Colors.amber,
                          // child: AssetImage( ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Column(
                    children: [
                      Text("Enter your prompt"),
                      SizedBox(height: 10),

                      TextFormField(
                        controller: promptController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            // if (promptController.value != "") {
                            await GeneratorCubit.get(
                              context,
                            ).sendPrompt(promptController.text);
                            // }
                          },
                          label: Text("Generate"),
                          icon: Icon(Icons.generating_tokens),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
