/// here is the time_cap_addr module

module time_cap_addr::TIME_CAP {
	use std::signer;
	use std::vector;
    use std::timestamp;
    use std::error;

	const TIME_NOT_OVER: u64 = 1;
    const TIME_OVER: u64 = 2;
    const NOT_OWNER:u64 =3;
    const TIME_CAPSULE_NOT_EXIST:u64 =4;
    const TIME_CAPSULE_ALREADY_EXIST:u64 =5;


    struct TimeCap has key,drop {
        owner: address,
        time: u64,
        data: vector<u8>
    }

	public fun initTimeCapsule(account: &signer, time: u64) {
        let now = timestamp::now_seconds();
        let timeCap = TimeCap {
            owner: signer::address_of(account),
            time: time + now,
            data: vector::empty<u8>()
        };
        assert!(!exists<TimeCap>(signer::address_of(account)), TIME_CAPSULE_ALREADY_EXIST);
        move_to(account, timeCap);
    }
   
    public fun deleteTimeCapsule(account: &signer) acquires TimeCap {
        let addr = signer::address_of(account);
        assert!(exists<TimeCap>(addr), TIME_CAPSULE_NOT_EXIST);
        let timeCap = borrow_global_mut<TimeCap>(addr);
        assert!(addr == timeCap.owner, NOT_OWNER);
        let now = timestamp::now_seconds();
        assert!(now >= timeCap.time, TIME_NOT_OVER);
        let _ = move_from<TimeCap>(addr);

    }

    public fun updateData(account: &signer, data: vector<u8>) acquires TimeCap {
        assert!(exists<TimeCap>(signer::address_of(account)), TIME_CAPSULE_NOT_EXIST);
        let timeCap = borrow_global_mut<TimeCap>(signer::address_of(account));
        timeCap.data = data;
    }


	
	#[view]
    public fun getTimeLeft(account: &signer): u64  acquires TimeCap{
        assert!(exists<TimeCap>(signer::address_of(account)), TIME_CAPSULE_NOT_EXIST);
        let timeCap = borrow_global<TimeCap>(signer::address_of(account));
        let now = timestamp::now_seconds();
        let timeLeft = timeCap.time - now;
        timeLeft
        }

    public fun getData(account: &signer): vector<u8>  acquires TimeCap{
        assert!(exists<TimeCap>(signer::address_of(account)), TIME_CAPSULE_NOT_EXIST);
        assert!(getTimeLeft(account) > 0, error::permission_denied(TIME_NOT_OVER));
        let timeCap = borrow_global<TimeCap>(signer::address_of(account));
        timeCap.data
    }
}