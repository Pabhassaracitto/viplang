import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../widgets/audio_player_widget.dart';

class AudioPlaylistScreen extends StatefulWidget { const AudioPlaylistScreen({super.key}); @override State<AudioPlaylistScreen> createState()=>_AudioPlaylistScreenState(); }
class _AudioPlaylistScreenState extends State<AudioPlaylistScreen> {
  int _repeat = 1; Timer? _sleep; Duration? _sleepAfter;
  @override void dispose(){_sleep?.cancel(); super.dispose();}
  void _setSleep(Duration? value){_sleep?.cancel(); if(value != null) _sleep=Timer(value, (){ if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã hẹn giờ tắt audio'))); }); setState(()=>_sleepAfter=value);}
  @override Widget build(BuildContext context){
    final themes=AllThemesRegistry.getAllThemes();
    return Scaffold(appBar: AppBar(title: const Text('List audio thông minh'), actions:[IconButton(onPressed:()=>showModalBottomSheet(context:context,builder:(_)=>_Options(repeat:_repeat,onRepeat:(v){setState(()=>_repeat=v); Navigator.pop(context);},onSleep:(v){_setSleep(v); Navigator.pop(context);}}),icon:const Icon(Icons.tune),tooltip:'Tùy chọn nghe')]),
      body: ListView(padding: const EdgeInsets.all(16), children:[
        Card(child: ListTile(leading: const Icon(Icons.headphones), title: const Text('Nghe thụ động'), subtitle: Text('Lặp $_repeat lần${_sleepAfter == null ? '' : ' · tắt sau ${_sleepAfter!.inMinutes} phút'}'), trailing: const Icon(Icons.play_circle_fill))),
        const SizedBox(height: 8), ...themes.map((t)=>Card(child: ExpansionTile(leading: Text(t.iconEmoji,style:const TextStyle(fontSize:25)),title:Text(t.titleVi),subtitle:Text(t.titleEn),children:[Padding(padding:const EdgeInsets.all(12),child:AudioPlayerWidget(themeId:t.id,trackNum:1,title:'${t.titleEn} · Bài 1'))]))) ]));
  }
}
class _Options extends StatelessWidget { final int repeat; final ValueChanged<int> onRepeat; final ValueChanged<Duration?> onSleep; const _Options({required this.repeat,required this.onRepeat,required this.onSleep}); @override Widget build(BuildContext c)=>SafeArea(child:Column(mainAxisSize:MainAxisSize.min,children:[const ListTile(title:Text('Ưu tiên nghe'),subtitle:Text('Lặp đặc biệt theo lựa chọn của bạn')),Wrap(spacing:8,children:[1,2,3,5,10].map((n)=>ChoiceChip(label:Text('$n lần'),selected:n==repeat,onSelected:(_)=>onRepeat(n)).toList()),const Divider(),ListTile(title:const Text('Hẹn giờ tắt'),trailing:DropdownButton<int?>(value:null,hint:const Text('Chọn'),items:const [DropdownMenuItem(value:15,child:Text('15 phút')),DropdownMenuItem(value:30,child:Text('30 phút')),DropdownMenuItem(value:60,child:Text('60 phút'))],onChanged:(v)=>onSleep(v==null?null:Duration(minutes:v))))])); }
