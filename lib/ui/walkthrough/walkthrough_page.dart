import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/constants/color_constants.dart';
import 'package:blindwind/constants/walktrhough_constants.dart';
import 'package:blindwind/navigator/global_navigator_bloc.dart';
import 'package:blindwind/navigator/global_navigator_event.dart';
import 'package:blindwind/navigator/walkthrough/walkthrough_navigator_bloc.dart';
import 'package:blindwind/navigator/walkthrough/walkthrough_navigator_event.dart';
import 'package:blindwind/navigator/walkthrough/walkthrough_navigator_state.dart';
import 'package:blindwind/tools/base_tools.dart';
import 'package:blindwind/tools/show_up_animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Widget> _backgroundImages = [
  Container(
    child: Image(
      fit: BoxFit.fill,
      image: AssetImage(IMAGE1_PATH),
      gaplessPlayback: true,
    ),
  ),
  Container(
    child: Image(
      fit: BoxFit.fill,
      image: AssetImage(IMAGE2_PATH),
      gaplessPlayback: true,
    ),
  ),
  Container(
    child: Image(
      fit: BoxFit.fill,
      image: AssetImage(IMAGE3_PATH),
      gaplessPlayback: true,
    ),
  ),
];

class WalkthroughPage extends StatefulWidget {
  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage>
    with SingleTickerProviderStateMixin {
  WalkthroughNavigatorBloc _walkthroughNavigatorBloc;
  GlobalNavigatorBloc _globalNavigatorBloc;
  TabController _tabController;

  final List<String> _headers = [
    HEADER_PAGE1,
    HEADER_PAGE2,
    HEADER_PAGE3,
  ];

  final List<String> _content = [
    CONTANT_PAGE1,
    CONTANT_PAGE2,
    CONTANT_PAGE3,
  ];

  @override
  void initState() {
    _globalNavigatorBloc = BlocProvider.of<GlobalNavigatorBloc>(context);
    _walkthroughNavigatorBloc =
        WalkthroughNavigatorBloc(numberOfPages: _backgroundImages.length - 1);
    _walkthroughNavigatorBloc.dispatch(WalkthroughOpen());
    _tabController = TabController(
      length: _backgroundImages.length,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(IMAGE1_PATH), context);
    precacheImage(AssetImage(IMAGE2_PATH), context);
    precacheImage(AssetImage(IMAGE3_PATH), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext widgetContext) {
    return BlocBuilder(
      bloc: _walkthroughNavigatorBloc,
      builder: (BuildContext context, WalkthroughNavigatorState state) {
        return BlocListener<WalkthroughNavigatorBloc,
            WalkthroughNavigatorState>(
          bloc: _walkthroughNavigatorBloc,
          listener:
              (BuildContext context, WalkthroughNavigatorState listeningState) {
            if (listeningState is WalkthroughFirstPageOpen) {
              _tabController.animateTo(0);
            }
            if (listeningState is WalkthroughPageOpen) {
              _tabController.animateTo(listeningState.pageNumber);
            }
            if (listeningState is WalkthroughLastPageOpen) {
              _tabController.animateTo(_backgroundImages.length - 1);
            }
          },
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    bottom: setWidth(200),
                  ),
                  child: TabBarView(
                    children: _backgroundImages,
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width,
                    height:
                        setHeight(MediaQuery.of(context).size.height * 1 / 3),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: WHITE_COLOR,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                              top: setWidth(20),
                              left: setWidth(30),
                            ),
                            width: setWidth(320),
                            child: ShowUp(
                              child: Text(
                                (state is WalkthroughPageOpen)
                                    ? _headers[state.pageNumber]
                                    : (state is WalkthroughFirstPageOpen)
                                        ? _headers.first
                                        : _headers.last,
                                style: TextStyle(
                                  fontSize: setSp(25),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: setWidth(90),
                            left: setWidth(30),
                            right: setWidth(30),
                          ),
                          child: ShowUp(
                            child: Text(
                              (state is WalkthroughPageOpen)
                                  ? _content[state.pageNumber]
                                  : (state is WalkthroughFirstPageOpen)
                                      ? _content.first
                                      : _content.last,
                              style: TextStyle(
                                fontSize: setSp(16.5),
                              ),
                              maxLines: null,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: setWidth(20),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: DotsIndicator(
                            dotsCount: 3,
                            reversed: false,
                            position: (state is WalkthroughPageOpen)
                                ? state.pageNumber
                                : (state is WalkthroughFirstPageOpen)
                                    ? 0
                                    : _backgroundImages.length - 1,
                            decorator: DotsDecorator(
                                color: MID_GREY_COLOR,
                                activeColor: BLACK_COLOR,
                                size: Size.square(5),
                                activeSize: Size.square(8)),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: (state is WalkthroughLastPageOpen) ? 0 : 1,
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: setWidth(20),
                              right: setWidth(30),
                            ),
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: setWidth(65),
                              height: setWidth(65),
                              child: FloatingActionButton(
                                elevation: 0,
                                tooltip: TOOLTIP_NEXT,
                                backgroundColor: BLACK_COLOR,
                                onPressed: () => _walkthroughNavigatorBloc
                                    .dispatch(WalkthroughNextTapped()),
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: setWidth(34),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // я пофиксил проблему, но пришлось немного размеры кнопки убавить, возможно придётся остальные тоже уменьшить
                          // увеличил отступ снизу и вроде не так заметно стало, в общем я бы уменьшил все кнопки на 5 :) и еще такая тема, как я понял они не в константах,
                          // так что лучше их вынести в константы тоже, мне поэтому и фиксить впадлу ))
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(
                            bottom: setWidth(25),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _globalNavigatorBloc
                                  .dispatch(WalkthroughFinished());
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: BLACK_COLOR,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(35),
                                  topLeft: Radius.circular(35),
                                ),
                              ),
                              width: (state is WalkthroughLastPageOpen)
                                  ? setWidth(160)
                                  : setWidth(0),
                              height: setWidth(60),
                              padding: EdgeInsets.all(
                                setWidth(15),
                              ),
                              child: Row(
                                children: <Widget>[
                                  if (state is WalkthroughLastPageOpen)
                                    Expanded(
                                      child: Text(
                                        TOOLTIP_FINISH,
                                        style: TextStyle(
                                            fontSize: BASE_FONT_TEXT_SIZE,
                                            color: WHITE_COLOR),
                                      ),
                                    ),
                                  if (state is WalkthroughLastPageOpen)
                                    Expanded(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: setWidth(34),
                                        color: WHITE_COLOR,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        (state is InitialWalkthroughNavigatorState)
                            ? Container()
                            : AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity:
                                    (state is WalkthroughFirstPageOpen) ? 0 : 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    bottom: setWidth(20),
                                    left: setWidth(30),
                                  ),
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: setWidth(65),
                                    height: setWidth(65),
                                    child: FloatingActionButton(
                                      elevation: 0,
                                      tooltip: TOOLTIP_BACK,
                                      backgroundColor: BLACK_COLOR,
                                      onPressed: () => _walkthroughNavigatorBloc
                                          .dispatch(WalkthroughBackTapped()),
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: setWidth(34),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
