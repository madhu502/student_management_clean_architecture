import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class LoadBatch extends StatelessWidget {
  final WidgetRef ref;
  final List<BatchEntity> lstBatches;
  const LoadBatch({super.key, required this.lstBatches, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstBatches.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(lstBatches[index].batchName),
            subtitle: Text(lstBatches[index].batchId ?? ""),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Are you sure you want to delete ${lstBatches[index].batchName}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ref
                            .read(batchViewModelProvider.notifier)
                            .deleteBatch(lstBatches[index]);
                          },
                          child: const Text('Yes')),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          )),
    );
  }
}
