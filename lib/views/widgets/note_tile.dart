import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key});

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.amber,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Flutter tips'),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Build your career with Fady Fawzy',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16, bottom: 16),
            child: Text(
              'Nov 16, 2023',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
