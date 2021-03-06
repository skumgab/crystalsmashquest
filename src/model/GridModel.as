package model {
	import model.vo.GridVo;

	import signals.notifications.GridUpdateSignal;

	public class GridModel {

		[Inject]
		public var gridUpdateSignal : GridUpdateSignal;

		private var _grid : Vector.<GridVo>;
		private var _collapseGrid : Vector.<GridVo>;

		public function get grid():Vector.<GridVo> {
			return _grid;
		}

		public function set grid(value:Vector.<GridVo>):void {
			_grid = value;
			gridUpdateSignal.dispatch(_grid);
		}

		public function get collapseGrid():Vector.<GridVo> {
			return _collapseGrid;
		}

		public function set collapseGrid(value:Vector.<GridVo>):void {
			_collapseGrid = value;
		}
	}
}
