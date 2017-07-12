//
//  ViewController.m
//  InstaKilo
//
//  Created by Thiago Hissa on 2017-07-12.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewController.h"
#import "MyCellViewCell.h"

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *defaultLayout;

@property (nonatomic) NSArray *locationEurope;
@property (nonatomic) NSArray *locationUS;
@property (nonatomic) NSArray *subjectEletronic;
@property (nonatomic) NSArray *subjectElse;

@property (nonatomic) NSMutableArray *section1Array;
@property (nonatomic) NSMutableArray *section2Array;

@property (nonatomic) int valueDefinesTextSection1;
@property (nonatomic) int valueDefinesTextSection2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.defaultLayout setSectionInset:UIEdgeInsetsMake(15, 8, 30, 8)];
    
    self.locationEurope = @[@"image1.jpg",@"image2.jpg",@"image4.jpg",@"image10.jpg"];
    self.locationUS = @[@"image3.jpg",@"image5.jpg",@"image6.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg"];
    self.subjectEletronic = @[@"image1.jpg",@"image2.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg"];
    self.subjectElse = @[@"image3.jpg",@"image4.jpg",@"image5.jpg",@"image6.jpg",@"image10.jpg"];
    
    self.section1Array = [[NSMutableArray alloc]initWithArray:@[@"image2.jpg",@"image3.jpg",@"image1.jpg",@"image4.jpg",@"image5.jpg"]];
    
    self.section2Array = [[NSMutableArray alloc]initWithArray:@[@"image6.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg"]];
    
    self.valueDefinesTextSection1 = 0;
    self.valueDefinesTextSection2 = 0;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
    return self.section1Array.count;
    }
    else{
    return self.section2Array.count;
    }
}







-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCellViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"protoCell" forIndexPath:indexPath];
    
    if(indexPath.section == 0){
        cell.albumImage.image = [UIImage imageNamed:self.section1Array[(int)indexPath.item]];
    }
    else if (indexPath.section == 1){
        cell.albumImage.image = [UIImage imageNamed:self.section2Array[(int)indexPath.item]];
    }
    
    return cell;
    
}





-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"myTitle" forIndexPath:indexPath];
        
        UILabel *headerLabel = [header viewWithTag:1];
        headerLabel.text = [self getString];
        UILabel *subHeader = [header viewWithTag:2];
        subHeader.text =  [self getStringSub:(int)indexPath.section];
        
        return header;
    }
    
    
    
    return nil;
}





- (IBAction)sortByLocation:(id)sender {
    [self.section1Array removeAllObjects];
    [self.section1Array addObjectsFromArray:self.locationEurope];
    [self.section2Array removeAllObjects];
    [self.section2Array addObjectsFromArray:self.locationUS];
    self.valueDefinesTextSection1 = 1;
    [self.collectionView reloadData];
}




- (IBAction)sortByKindSubject:(id)sender {
    [self.section1Array removeAllObjects];
    [self.section1Array addObjectsFromArray:self.subjectEletronic];
    [self.section2Array removeAllObjects];
    [self.section2Array addObjectsFromArray:self.subjectElse];
    self.valueDefinesTextSection1 = 2;
    [self.collectionView reloadData];
}


- (IBAction)defaultButton:(id)sender {
    self.section1Array = [[NSMutableArray alloc]initWithArray:@[@"image2.jpg",@"image3.jpg",@"image1.jpg",@"image4.jpg",@"image5.jpg"]];
    
    self.section2Array = [[NSMutableArray alloc]initWithArray:@[@"image6.jpg",@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg"]];
    self.valueDefinesTextSection1 = 0;
    [self.collectionView reloadData];
}



-(NSString*)getString{
    NSString *string;
    
    if(self.valueDefinesTextSection1 == 0){
        string = @"Default";
    }
    else if (self.valueDefinesTextSection1 == 1){
        string = @"Location";
    }
    else{
        string = @"Kind";
    }
    
    return string;
}

-(NSString*)getStringSub:(int)section{
    NSString *string;
    
    if(section == 0){
    if(self.valueDefinesTextSection1 == 0){
        string = @"Best of 2017";
    }
    else if (self.valueDefinesTextSection1 == 1){
        string = @"Artists from Europe";
    }
    else{
        string = @"Eletronic Music";
    }
    }
    else{
        if(self.valueDefinesTextSection1 == 0){
            string = @"Best of 2017";
        }
        else if (self.valueDefinesTextSection1 == 1){
            string = @"Artists from the US";
        }
        else{
            string = @"House Music";
        }
    }
    
    return string;
}


@end
