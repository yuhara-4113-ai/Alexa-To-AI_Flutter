// 必要なパッケージとファイルをインポート
import 'package:flutter/material.dart'; // Flutterのマテリアルデザインパッケージ
import '../widgets/drawer.dart';
import 'home_screen.dart'; // home_screen.dartファイル
import 'chat_ai_screen.dart'; // chat_ai_screen.dartファイル

// 設定画面の状態を管理する StatefulWidget
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key}); // コンストラクタ

  // 画面名取得
  String get name => '設定画面';

  @override
  SettingScreenState createState() => SettingScreenState();
}

// 設定画面の状態を管理する State
class SettingScreenState extends State<SettingScreen> {
  // 各項目の初期値
  String _name = ''; // 名前
  String _personality = 'A'; // 性格
  String _tone = 'D'; // 口調

  @override
  Widget build(BuildContext context) {
    const homeScreen = HomeScreen();
    const chatAIScreen = ChatAIScreen();

    // Scaffoldを使用して基本的なレイアウトを作成
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name), // アプリバーのタイトル
      ),
      drawer: CustomDrawer(
        // todo 今はtilesを各画面でコピペで定義している状態。各画面で自画面は非表示にできたら、シンプルにできる
        tiles: [
          ListTile(
            title: Text(homeScreen.name),
            onTap: () {
              // ホーム画面への遷移
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => homeScreen),
              );
            },
          ),
          ListTile(
            title: Text(chatAIScreen.name),
            onTap: () {
              // AIチャット画面への遷移
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => chatAIScreen),
              );
            },
          ),
        ],
      ),
      // 画面の主要な部分
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // フォームの項目(定義順に縦に並べる)
          children: [
            // 呼び名の入力フォーム
            TextField(
              decoration: const InputDecoration(labelText: '呼び名'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            // 性格の入力フォーム
            DropdownButtonFormField(
              value: _personality, // 初期値
              // ドロップダウン項目の定義
              items: ['A', 'B', 'C']
                  .map((label) => DropdownMenuItem(
                        value: label, // 各項目の値を設定します
                        child: Text(label), // 各項目のラベルを設定します
                      ))
                  .toList(), // ドロップダウンの項目をリストとして設定します
              onChanged: (value) {
                // 項目が選択されたときの動作を定義します
                setState(() {
                  _personality = value!; // 選択された項目の値で_personalityを更新します
                });
              },
              decoration:
                  const InputDecoration(labelText: '性格'), // フォームのラベルを設定します
            ),
            // 口調の入力フォーム
            DropdownButtonFormField(
              value: _tone, // 初期値
              // ドロップダウン項目の定義
              items: ['D', 'E', 'F']
                  .map((label) => DropdownMenuItem(
                        value: label, // 各項目の値を設定します
                        child: Text(label), // 各項目のラベルを設定します
                      ))
                  .toList(), // ドロップダウンの項目をリストとして設定します
              onChanged: (value) {
                // 項目が選択されたときの動作を定義します
                setState(() {
                  _tone = value!; // 選択された項目の値で_toneを更新します
                });
              },
              decoration:
                  const InputDecoration(labelText: '口調'), // フォームのラベルを設定します
            ),
            // 保存ボタン
            const SizedBox(height: 20), // フォームとボタンの間にスペースを作成します
            ElevatedButton(
              onPressed: () {
                _saveSettings(); // ボタンが押されたときに、_saveSettingsメソッドを呼び出します
              },
              child: const Text('保存'), // ボタンのラベルを設定します
            ),
          ],
        ),
      ),
    );
  }

  /// `_saveSettings`メソッドは、設定を保存します。
  ///
  /// このメソッドは、設定の保存処理を行い、その結果をデバッグ出力します。
  void _saveSettings() {
    // 保存の処理をここに追加する
    debugPrint('保存しました: 名前=$_name, 性格=$_personality, 口調=$_tone');
  }
}
