import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message) {
  if (Navigator.of(context).canPop()) {
    Navigator.pop(context); // Dismiss any existing dialogs
  }
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 421,
        width: 346,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xff4F2AB8)),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              height: 103,
              width: 103,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 12, color: const Color(0x48FFFFFF))),
              child: const Icon(
                Icons.close,
                size: 55,
                color: Color(0xff4F2AB8),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "An error occurred",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            const SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              message,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 33),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.white,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    63,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Color(0xff4F2AB8),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}