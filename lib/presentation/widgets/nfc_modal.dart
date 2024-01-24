import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/widgets/button_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcModal extends StatefulWidget {
  final Function(String) onTagDataReceived;
  NfcModal({
    required this.onTagDataReceived,
    Key? key,
  }) : super(key: key);

  @override
  _NfcModalState createState() => _NfcModalState();
}

class _NfcModalState extends State<NfcModal> {
  @override
  void initState() {
    super.initState();

// Start Session
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        handleNfcTagData(tag.data.values.first);
      },
    );
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }

  void handleNfcTagData(String data) {
    widget.onTagDataReceived(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 15,
                          child: Center(
                            child: Container(
                              height: 4,
                              width: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color:
                                      MaterialStateProperty.resolveAs<Color?>(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant
                                              .withOpacity(0.4),
                                          <MaterialState>{})),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SvgPicture.asset('assets/images/nfc.svg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  "Приложите карту для чтения NFC к смартфону",
                  textAlign: TextAlign.center,
                  style: CustomTextTheme.subheadlineNS
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ButtonMain(
                  text: "Отмена",
                  onClick: () {
                    Navigator.pop(context);
                    NfcManager.instance.stopSession();
                  },
                ),
              )
            ])));
  }
}
