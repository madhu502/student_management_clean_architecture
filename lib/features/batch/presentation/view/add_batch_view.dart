import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';

class AddBatchView extends ConsumerStatefulWidget {
  const AddBatchView({super.key});

  @override
  ConsumerState<AddBatchView> createState() => _AddBatchViewState();
}

class _AddBatchViewState extends ConsumerState<AddBatchView> {
  final _formKey = GlobalKey<FormState>();
  final gap = const SizedBox(height: 8);
  final batchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchHiveModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                gap,
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add Batch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gap,
                TextFormField(
                  controller: batchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Batch Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter batch';
                    }
                    return null;
                  },
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                       
                            
                      }
                    },
                    child: const Text('Add Batch'),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'List of Batches',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
