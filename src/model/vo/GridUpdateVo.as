package model.vo {
	public class GridUpdateVo {

		public var crystalID	: int;
		public var color		: String;
		public var gridVo		: GridVo;
		public var state		: int;

		public function GridUpdateVo(id, color, vo, state) {
			this.crystalID = id;
			this.color = color;
			this.gridVo = vo;
			this.state = state;
		}
	}
}
