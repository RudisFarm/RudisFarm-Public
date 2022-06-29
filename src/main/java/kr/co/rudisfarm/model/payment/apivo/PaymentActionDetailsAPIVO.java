package kr.co.rudisfarm.model.payment.apivo;

public class PaymentActionDetailsAPIVO {
	private String aid;
	private String approved_at;
	private int amount;
	private int point_amount;
	private int discount_amount;
	private String payment_action_type;
	private String payload;
	
	public PaymentActionDetailsAPIVO() {}
	
	public PaymentActionDetailsAPIVO(String aid, String approved_at, int amount, int point_amount, int discount_amount,
			String payment_action_type, String payload) {
		super();
		this.aid = aid;
		this.approved_at = approved_at;
		this.amount = amount;
		this.point_amount = point_amount;
		this.discount_amount = discount_amount;
		this.payment_action_type = payment_action_type;
		this.payload = payload;
	}

	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = approved_at;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public int getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}
	public String getPayment_action_type() {
		return payment_action_type;
	}
	public void setPayment_action_type(String payment_action_type) {
		this.payment_action_type = payment_action_type;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}

	@Override
	public String toString() {
		return "PaymentActionDetailsVO [aid=" + aid + ", approved_at=" + approved_at + ", amount=" + amount
				+ ", point_amount=" + point_amount + ", discount_amount=" + discount_amount + ", payment_action_type="
				+ payment_action_type + ", payload=" + payload + "]";
	}
}
