// CURRENT-APPROACH
// For now just printing the data in the xml licence with heading tags and
// horizontal rules


// PROPOSED-APPROACH
// With stack implementation, I will try to change the LICENSE file into
// following format.
// {
//   "tag_name": "<NAME>",
//   "attributes": {
//     "data1": "value1"
//   }
//   "content": "Text present if any",
//   children: [
//     Similar Objects if any
//   ]
//mport 'license-parser.dart';
import 'dart:io';

void main() async {
  print("Print LICENSE\nChoose 1 or 2");
  print("1. Template LICENSE");
  print(
      "2. Short name of SPDX license('0BSD','AAL','Abstyles','ADSL',etc..)");
  stdout.write("Choose 1 or 2: ");
  try {
    int input = int.parse(stdin.readLineSync()!);

    File licenseFile = new File("license.xml");

    switch (input) {
      case 1:
        break;
      case 2:
        try {
          stdout.write("SPDX-Identifier: ");
          String name = stdin.readLineSync()!;
          String url =
              "https://raw.githubusercontent.com/spdx/license-list-XML/master/src/$name.xml";
          print("\n\n\n\n\n\n\n\n\n\nReading from ...\n$url");
          var httpCLient = new HttpClient();
          var httpRequest = await httpCLient.getUrl(Uri.parse(url));
          var httpResponse = await httpRequest.close();
          await httpResponse.pipe(licenseFile.openWrite());
          httpCLient.close(force: true);
          break;
        } catch (e) {
          print("Something went wrong! Error Created!");
          print(e);
          break;
        }
      default:
        break;
    }

    XMLParser().printLicense();
  } catch (e) {
    print("ERROR-DETECTED");
    print(e);
  }
}
